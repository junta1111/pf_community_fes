class Public::UsersController < ApplicationController
 before_action :guest_check, except: [:show]

 def show
  @user = current_user
  @goods = Good.where(user_id: @user.id).order(comment: :desc).limit(5)
 end

 def edit
  @user = current_user
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

 def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
 end

 def good
  @user = current_user
  @goods = Good.where(user_id: @user.id)
 end

 def update
  @user = User.find(params[:id])
  if @user.update(user_params)
  redirect_to user_path
  else
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
  render :edit
  end
 end

 private

 def user_params
  params.require(:user).permit(:profile_image, :nickname, :place, :sex, :year, favorite_events_attributes: [:event_name, :_destroy, :id])
 end

 def set_user
    @user = User.find(params[:id])
 end
end
