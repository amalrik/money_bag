class EventsController < ApplicationController

  def new
    @dashboard = current_user.dashboards.first
    @event = @dashboard.events.build
    respond_to do |format|
      format.js {render 'new.js.erb'}
    end
  end

  def create
    dashboard = Dashboard.where(id: params[:event][:dashboard_id]).take

    respond_to do |format|
      if dashboard.add_event event_params
        format.js { render 'create.js.erb' }
      else
        format.js { render 'create_error.js.erb' }
      end
    end
  end

  private
  def event_params
    params.require(:event).permit(:date, :kind, :amount)
  end
end
