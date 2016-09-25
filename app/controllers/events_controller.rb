class EventsController < ApplicationController

  def new
    @dashboard = current_user.dashboard
    @event = @dashboard.events.build
    respond_to do |format|
      format.js {render 'new.js.erb'}
    end
  end

  def create
    dashboard = Dashboard.where(id: params[:event][:dashboard_id]).take
    event = dashboard.events.build event_params

    respond_to do |format|
      if event.save
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
