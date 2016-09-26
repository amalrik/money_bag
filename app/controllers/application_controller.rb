class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    dashboard_path(current_user.dashboards.first)
  end

  def check_permission_to_dashboard
    redirect_to root_path unless user_has_access_to_dashboard?
  end

end
