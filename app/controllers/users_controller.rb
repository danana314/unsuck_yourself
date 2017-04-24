class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    User.find(params[:id]).update!(username: params[:user][:username])
    redirect_to users_path
  end

end
