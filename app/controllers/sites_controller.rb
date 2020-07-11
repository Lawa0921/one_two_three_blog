class SitesController < ApplicationController
  def index
    @sites = Site.all.order("RANDOM()").limit(9)
  end
end
