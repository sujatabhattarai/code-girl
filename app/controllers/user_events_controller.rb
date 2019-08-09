class UserEventsController < ApplicationController

  before_action :signed_in_user, only: [ :new]
  before_action :require_admin, only: [:index]

  def new
    @user_event = UserEvent.new
  end

  def create
    if params[:event_ids].nil?
      flash[:danger] = "Please select an event to register"
      redirect_to register_path
    else
      params[:event_ids].each do |event|
        @user_event = UserEvent.new(user_id: params[:userId], event_id: event)
        if @user_event.save
          flash[:success] = "You have registered successfully"
        else
          flash[:danger] = "Not Saved"
          render 'users/show'
        end
      end
      redirect_to user_path(params[:userId])
    end
  end

  def index
    @user_events = UserEvent.all
  end

  def show
    @user_event = UserEvent.find(params[:id])
  end

  def destroy
    @user_event= UserEvent.find(params[:id])
    @user_event.destroy
    flash[:success] = "You have successfully unregistered from the event"
    redirect_to user_path(current_user)
  end
end