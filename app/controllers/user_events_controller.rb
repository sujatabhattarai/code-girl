class UserEventsController < ApplicationController

  def new
    @user_event = UserEvent.new
  end
end