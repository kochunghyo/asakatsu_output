class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :following, :followers]
  
  def show
    @outputs = @user.outputs
  end


  def following
    @users = @user.following
    render 'show_following'
  end

  def followers
    @users = @user.followers
    render 'show_follower'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end