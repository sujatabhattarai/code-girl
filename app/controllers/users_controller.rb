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
      flash[:notice] = "You registered successfully"
      flash[:color]= "valid"
      redirect_to @user
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
      render "new"
    end
  end

  # def create(request)
  #   new_user = User.new
  #   new_user.fname = params[:fname]
  #   new_user.lname = params[:lname]
  #   new_user.email = params[:email]
  #   new_user.save
  # end

  # def login
  #   username = params[:user]
  #   password = params[:password]
  #   u = User.find_by_email(username)
  #   if u
  #     if u.password == password
  #       redirect_to "somepage"
  #     end
  #   end
  #
  # end
  def show
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end