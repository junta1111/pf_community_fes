class Public::UsersController < ApplicationController
 def show
  @user = User.find(params[:id])
 end

 def edit
  @user = User.find(params[:id])
 end

 def unsubscribe
 end

 def good
 end

 def update
  user = User.find(params[:id])
  user.update(user_params)
  redirect_to user_path
 end

 private

 def user_params
  params.require(:user).permit(:profile_image, :nickname, :place, :sex, :year, :event_name)
 end
end
