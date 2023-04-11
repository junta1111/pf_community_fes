class Public::GoodsController < ApplicationController
  before_action :guest_check

  def create
    @user = current_user
    @good = Good.new(user_id: @user.id, comment_id: params[:comment_id])
    @good.save
    comment = Comment.find(params[:comment_id])
    @path = params[:path]
    if @path == "/users/good"
    @comments = Comment.where(id: Good.where(user_id: @user.id).pluck(:comment_id))
    else
    @comments = comment.community.comments
    #redirect_to community_path(@good.comment.community)
    end
  end

  def destroy
    @user = current_user
    @good = Good.find_by(user_id: @user.id, comment_id: params[:comment_id])
    @good.destroy
    comment = Comment.find(params[:comment_id])
    @path = params[:path]
    if @path == "/users/good"
    @comments = Comment.where(id: Good.where(user_id: @user.id).pluck(:comment_id))
    else
    @comments = comment.community.comments
    #redirect_to community_path(@good.comment.community)
    end
  end
end
