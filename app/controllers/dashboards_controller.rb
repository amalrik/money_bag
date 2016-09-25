class DashboardsController < ApplicationController
  
  def show
    @dashboard = current_user.dashboard
    @events = @dashboard.events
  end
end
