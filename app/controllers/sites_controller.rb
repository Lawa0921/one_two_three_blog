class SitesController < ApplicationController
  def index
    if params[:user_name].present?
      @sites = current_user.sites
    else
      @sites = Site.all.order("RANDOM()").limit(9)
    end
  end

  def create
    @site = Site.new(site_params)
    @site.owner = current_user.name
    if @site.users << current_user && @site.save
      redirect_to sites_path(user_name: current_user.name), notice: t("site.create")
    else
      render :new
    end
  end
  
  def new
    @site = Site.new
  end

  def show
    target_site
  end

  private
  def site_params
    params.require(:site).permit(:title, :description)
  end
end
