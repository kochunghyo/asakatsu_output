class UsersController < ApplicationController
  
  
  def show
    @user = User.find(params[:id])
    @outputs = @user.outputs
  end


  # private
  # def user_params
  #   params.require(:user).permit(:nickname, :face_image, :first_name, :last_name, :first_name_kana, :last_name_kana, :email, :encrypted_password)
  # end

end