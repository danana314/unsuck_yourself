class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :update]

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    User.find(params[:id]).update!(username: params[:user][:username])
    redirect_to users_path
  end

  private

  def authenticate_user!
    if current_user.anonymous?
      redirect_to root_path, alert: 'Not authenticated'
    end
  end
end
