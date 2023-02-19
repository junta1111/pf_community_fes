class Admin::CommunitiesController < ApplicationController
  def edit
    @communities = Community.find(params[:id])
  end

  def create
    @community = Community.new(community_params)
    @community.save
    redirect_to admin_root_path
  end

  def update
    @community = Community.find(params[:id])
    @community.update(community_params)
    redirect_to admin_root_path
  end

  def destroy
    @community = Community.find(params[:id])
    @community.destroy
    redirect_to admin_root_path
  end

  private

  def community_params
    params.require(:community).permit(:venue_year, :venue_month, :venue, :fes_name)
  end
end
