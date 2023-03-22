class Public::HomesController < ApplicationController
  def top
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
end
