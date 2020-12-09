class OutputsController < ApplicationController
  
  before_action :set_output, only: [:show, :edit, :update, :destroy]

  def index
    @outputs = Output.includes(:images).order("created_at DESC").limit(5)
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
    # unless(Time.zone.now.hour < 4 || Time.zone.now.hour >= 10)
    @output = Output.new(output_params)
    if @output.save
      redirect_to root_path, notice: '投稿が完了しました。'
    else
      @output.images.build
      render :new
    end
    # else
    # redirect_to root_path, notice: "投稿は朝4時から朝10時までです。"

  end

  def show
    @comment = Comment.new
    @comments = @output.comments.includes(:user)
  end

  def edit
  end

  def update
    if @output.update(output_params)
      redirect_to root_path, notice: "投稿を編集しました"
    else
      render :edit
    end
  end

  def destroy
    @output.destroy
    redirect_to root_path, notice: "投稿を削除しました"
  end

  def like
    like = Like.find_by(output_id: params[:id], user_id: current_user.id)
    if like == nil
      Like.create(output_id: params[:id], user_id: current_user.id)
    else
      like.destroy
    end
  end

  def new_guest
    user = User.find_or_create_by!(email: 'test@test.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.nickname =("ゲスト")
      user.first_name =("太郎")
      user.last_name =("ゲスト")
      user.first_name_kana =("タロウ")
      user.last_name_kana =("ゲスト")
      user.birthday =("1990-1-1")
    end
    sign_in user
    redirect_to root_path, notuce: 'ゲストユーザーとしてログインしました。'
  end

  private
    
  def output_params
    params.require(:output).permit(:title, :text, :type_id, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_output
    @output = Output.find(params[:id])
  end

end
