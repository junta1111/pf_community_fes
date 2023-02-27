class Public::CommunitiesController < ApplicationController
 def show
  @community = Community.all.includes(:user).order(created_at: :desc)
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
end
