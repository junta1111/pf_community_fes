class Public::UsersController < ApplicationController
 def show
  @user = User.find(params[:id])
 end

 def edit
  @user = User.find(params[:id])
  if (3-@user.favorite_events.size) == 3
   @user.favorite_events.build
   @user.favorite_events.build
   @user.favorite_events.build
  elsif (3-@user.favorite_events.size) == 2
   @user.favorite_events.build
   @user.favorite_events.build
  elsif (3-@user.favorite_events.size) == 1
   @user.favorite_events.build
  else
  end
 end

 def unsubscribe
 end

 def good
 end

 def update
  user = User.find(params[:id])
  user.update!(user_params)
  redirect_to user_path
 end

 private

 def user_params
  params.require(:user).permit(:profile_image, :nickname, :place, :sex, :year, favorite_events_attributes: [:event_name, :_destroy, :id])
 end
end
