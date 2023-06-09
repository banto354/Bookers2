class EventsController < ApplicationController
  def new
    @event = Event.new(group_id: params[:group_id])
  end
  
  def create
    @event = Event.new(event_params)
    @event.group_id = params[:group_id]
    @event.save
    render :show
  end
  
  def show
  end
  
  private
  
  def event_params
    params.require(:event).permit(:title, :body)
  end
  
end
