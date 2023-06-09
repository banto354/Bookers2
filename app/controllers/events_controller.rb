class EventsController < ApplicationController
  def new
    @event = Event.new(group_id: params[:group_id])
  end
  
  def create
    @event = Event.new(event_params)
    @event.group_id = params[:group_id]
    @group_users = GroupUser.where(group_id: params[:group_id])
    
    if @event.save
     EventMailer.event_mail(@event, @group_users).deliver
     render :show
    else
      render :new
    end
    
  end
  
  def show
  end
  
  private
  
  def event_params
    params.require(:event).permit(:title, :body)
  end
  
end
