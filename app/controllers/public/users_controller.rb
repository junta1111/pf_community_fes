class Public::UsersController < ApplicationController
 before_action :guest_check, except: [:show]

 def show
  @user = current_user
  @comments = @user.good_comments.joins(:goods).distinct.order('goods.created_at': :desc).limit(5)
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
    @user.comments.destroy_all
    @user.goods.destroy_all
    reset_session
    redirect_to root_path
 end

 def good
  @user = current_user
  @comments = Comment.where(id: Good.where(user_id: @user.id).pluck(:comment_id))
  @path = request.path_info
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
