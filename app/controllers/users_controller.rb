class UsersController < ApplicationController

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
end
