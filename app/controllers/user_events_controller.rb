class UserEventsController < ApplicationController

  def new
    @user_event = UserEvent.new
  end

  def create
    # debugger
    @user_event = UserEvent.new(user_id: params[:userId], event_id: params[:reg])
    # @user_event = UserEvent.new(params.require(:user_event).permit(:userId, :reg))
    if @user_event.save
      render 'index'
    else
      flash[:dnager] = "Not SAVED"
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
    redirect_to user_events_path
  end


private
  def signed_in_user
    unless logged_in?
      flash[:danger] = "Request denied. Please sign in. "
      redirect_to signin_url
    end
  end
end