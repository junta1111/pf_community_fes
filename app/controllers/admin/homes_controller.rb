class Admin::HomesController < ApplicationController

  def top
    @community = Community.new
    @communities = Community.all
    @year = params[:venue_year]
    @month = params[:venue_month]
    if @year.present? && @month.present?
      @communities = Community.where(venue_year: @year, venue_month: @month)
    else
      @communities = Community.all
    end
    #@communities = Community.where(venue_month: Date.today.strftime('%m')).where(venue_year: Date.today.strftime('%Y'))
  end
end
