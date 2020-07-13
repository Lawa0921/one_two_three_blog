class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @site.update(site_params)
      redirect_to sites_path(user_name: current_user.name), notice: t("site.update")
    else
      render :edit
    end
  end

  private
  def site_params
    params.require(:site).permit(:title, :description)
  end

  def set_site
    if params[:site_id].present?
      @site = Site.find_by!(title: params[:site_id])
    else
      @site = Site.find_by!(title: params[:id])
    end
  end
end
