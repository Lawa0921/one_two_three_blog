class ApplicationController < ActionController::Base
  helper_method :target_user, :target_site
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :nickname, :avatar])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :nickname, :avatar])
  end

  def target_user
    @target_user ||= User.find_by(name: params[:user_name])
  end

  def target_site
    if params[:site_id].present?
      @target_site ||= target_user.sites.find_by(title: params[:site_id])
    else
      @target_site ||= target_user.sites.find_by(title: params[:id])
    end
  end
end
