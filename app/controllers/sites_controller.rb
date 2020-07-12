class SitesController < ApplicationController
  def index
    @sites = Site.all.order("RANDOM()").limit(9)
  end

  def create
    @site = current_user.sites.new(site_params)
    if @site.save
      redirect_to sites_path, notice: t("site.create")
    else
      render :new
    end
  end
  
  def new
    @site = Site.new
  end

  private
  def site_params
    params.require(:site).permit(:title, :description)
  end
end
