class OutputsController < ApplicationController
  
  before_action :set_output, only: [:show, :edit, :update, :destroy]

  def index
    @outputs = Output.includes(:images).order("created_at DESC")
  end

  def new
    if user_signed_in?
      @output = Output.new
      @output.images.build
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @output = Output.new(output_params)
    if @output.save
      redirect_to root_path
    else
      @output.images.build
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @output.comments.includes(:user)
  end

  def edit
  end

  def update
    if @output.update(output_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @output.destroy
  end

  def like
    like = Like.find_by(output_id: params[:id], user_id: current_user.id)
    if like == nil
      Like.create(output_id: params[:id], user_id: current_user.id)
    else
      like.destroy
    end
  end

  private
    
  def output_params
    params.require(:output).permit(:title, :text, :type_id, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_output
    @output = Output.find(params[:id])
  end

end
