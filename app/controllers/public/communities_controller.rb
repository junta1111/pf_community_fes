class Public::CommunitiesController < ApplicationController
 def index
   @user = User.find(params[:format])
 end

 def show
   @community = Community.find(params[:id])#.includes(:user).order(created_at: :desc)
   @comments = @community.comments
   @comment = Comment.new

 end

 def create
   @community = Community.new(community_params)
   @community.user_id = current_user.id
   community.save
   redirect_to community_path
 end

 def search
   @q = Community.ransack(params[:q])
   if params[:q]
    @communities = @q.result(distinct: true)
   else
    @communities = Community.all
    @communities = @communities.where(venue_year: params[:venue_year]) if params[:venue_year].present?
    @communities = @communities.where(venue_month: params[:venue_month]) if params[:venue_month].present?
    @communities = @communities.where(venue: params[:venue]) if params[:venue].present?
   end
 end

 def search_results
 end

 private

 def community_params
  params.require(:community).permit(:comment)
 end
end
