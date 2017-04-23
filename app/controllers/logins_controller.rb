class LoginsController < ApplicationController
  include UsersHelper

  def index
    @user = User.new
  end

  def create

    user = User.where(email: params[:user].dig(:email)).first

    if user
      SendSignInEmail.new(user).call
      redirect_to root_path, notice: 'Login link sended to your email'
    else
      flash[:alert] = 'Could not find you account. Have you signup up yet?'
      @user = User.new(user_params)
      render action: :index
    end
  end

end
