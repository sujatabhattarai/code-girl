class EventsController < ApplicationController

  before_action :require_admin, only: :destroy

  def new
    @event = Event.new
  end

  def index
    @events = Event.paginate(page: params[:page], per_page: 5)
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Event created successfully"
      flash[:color]= "valid"
      redirect_to @event
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
      render "new"
    end
  end


  def show
    @event = Event.find(params[:id])
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = "Event deleted"
    redirect_to events_url
  end

  private

    def event_params
      params.require(:event).permit(:title, :description, :venue, :date_time)
    end

    def require_admin
      if !logged_in? || (logged_in? and !current_user.admin?)
        flash[:danger] = "Only admins can perform that action "
        redirect_to events_path
      end
    end
end