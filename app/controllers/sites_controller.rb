class SitesController < ApplicationController
  def index
    @sites = Site.all.order("RANDOM()").limit(9)
  end

  def create
  end
  
  def new
    @site = Site.new
  end
end
