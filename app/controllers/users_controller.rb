class UsersController < ApplicationController
  before_action :check_if_logged_in, only: [:profile]
  def new
    @user = User.new
  end

  def create
    user = User.create user_params

    if user.persisted?
      session[:user_id] = user.id
      redirect_to user_path(user) # redirect_to user
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_path
    end

  end

  def index
  end

  def show

    @user = User.find params[:id]
    # render json: {address: @user.address}
    @address = @user.address
    # raise 'hell'
  end

  def edit
  end

  def profile
    @user = @current_user
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :bio, :password, :address)
  end
end
