class Public::GoodsController < ApplicationController
  def create
    @good = Good.new(user_id: current_user.id, comment_id: params[:comment_id])
    @good.save
    redirect_to community_path(@good.user_id)
  end

  def destroy
    @good = Good.find_by(user_id: current_user.id, comment_id: params[:comment_id])
    @good.destroy
    redirect_to community_path(@good.user_id)
  end
end
