class UsersController < ApplicationController

  before_action :signed_in_user, only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "You have registered successfully"
      flash[:color]= "valid"
      redirect_to @user
    else
      render "new"
    end
  end


  def show
    @user = User.find(params[:id])
  end


  def index
    @users = User.paginate(page: params[:page], per_page: 5,)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Changes saved successfully"
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def signed_in_user
      unless logged_in?
        flash[:danger] = "Request denied. Please sign in. "
        redirect_to signin_url
      end
    end

    def valid_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user or current_user.admin?
    end

end