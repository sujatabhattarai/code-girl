class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user and user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully signed in"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Incorrect email or password"
      render 'new'
    end
  end

  #for signout purpose
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have signed out successfully."
    redirect_to root_path
  end

end