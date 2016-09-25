class EventsController < ApplicationController

  def new
    @event = Event.new
    respond_to do |format|
      format.js {render 'new.js.erb'}
    end
  end

  def create
    byebug
  end

  private
  def event_params
    params.require(:event).permit(:date, :kind, :amount, )
  end
end
