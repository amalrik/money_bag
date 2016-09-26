class DashboardsController < ApplicationController
  before_action :check_permission_to_dashboard
  
  def show
    @dashboard = current_user.dashboards.first
    @events = @dashboard.events
  end

  private
  def user_has_access_to_dashboard?
    (current_user.dashboards.where id: params[:id]).present?
  end
end
