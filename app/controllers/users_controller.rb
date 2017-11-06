class UsersController < ApplicationController
  before_action :reject_users, only: [:new, :create]
  before_action :require_user, only: [:show]

  def show
    @user = User.find(session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user)
      .permit(:email_address, :first_name, :last_name, :phone_number, :password)
  end
end
