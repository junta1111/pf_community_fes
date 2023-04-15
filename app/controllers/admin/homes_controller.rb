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
  end
end
