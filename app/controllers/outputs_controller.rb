class OutputsController < ApplicationController
  
  before_action :set_output, only: [:edit, :update, :show, :destroy]

  def index
    @outputs = Output.includes(:images).order("created_at DESC")
  end

  def new
    @output = Output.new
    @output.images.build
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

  def edit
  end

  def update
    @output.update(output_params)
  end

  def show
  end

  def destroy
    @output.destroy
  end


  private
    
  def output_params
    params.require(:output).permit(:title, :text, :type_id, images_attributes: [:src, :_destroy, :id])
  end

  def set_output
    @output = Output.find(1)
  end
end
