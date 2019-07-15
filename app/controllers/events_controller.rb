class EventsController < ApplicationController

  before_action :require_admin, except: [:index, :show]

  def index
    @events = Event.paginate(page: params[:page], per_page: 5)
  end

  def new
    @event = Event.new
  end


  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "Event created successfully"
      redirect_to events_path
    else
      render "new"
    end
  end


  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:success] = "Event was successfully updated"
      redirect_to event_path(@event)
    else
      render 'edit'
    end
  end


  def destroy
    @event= Event.find(params[:id])
    @event.destroy
    flash[:success] = "Event was successfully deleted"
    redirect_to events_path
  end

  private

    def event_params
      params.require(:event).permit(:title, :description, :venue, :date_time)
    end

    def require_admin
      if !logged_in? || (logged_in? and !current_user.admin?)
        flash[:danger] = "Only admins can perform that action "
        redirect_to events_path
      # else
      #   render 'new'
      end
    end

end