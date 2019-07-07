class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:notice] = "You registered successfully"
      flash[:color]= "valid"
      redirect_to @user
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
      render "new"
    end
  end


  def show
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end