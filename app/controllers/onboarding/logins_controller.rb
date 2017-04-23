class Onboarding::LoginsController < ApplicationController
  include UsersHelper

  def new
    @user = User.new
  end

  def create

    email_or_username = params[:user].dig(:email_or_username)
    user = User.find_by_email_or_username(email_or_username)

    if user
      SendSignInEmail.new(user).call
      redirect_to root_path, notice: 'Sweet. Login link sent to your email.'
    else
      flash[:alert] = 'Could not find you account. Have you signed up yet?'
      @user = User.new(email_or_username: email_or_username)
      render action: :new
    end
  end

end
