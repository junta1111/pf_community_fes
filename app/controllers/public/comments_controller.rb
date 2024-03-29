class Public::CommentsController < ApplicationController
  before_action :guest_check

  def create
    @community = Community.find(comment_params[:community_id])
    @comment = @community.comments.new(comment_params)
    @comment.user_id = current_user.id
    if params[:comment][:comment].blank?
      flash[:danger] = 'フォームにコメントが無いと送信できません。'
      redirect_to community_path(@community)
      return
    end

    if @comment.save!
      flash[:success] = 'コメントを投稿しました'
      redirect_to community_path(@community)
    else
      flash[:danger] = 'コメント投稿に失敗しました'
      redirect_back(fallback_location: community_path)
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    @community = comment.community
    comment.destroy
    redirect_to community_path(@community)
  end

  private
    def comment_params
      params.require(:comment).permit(:comment, :community_id)
    end
end
