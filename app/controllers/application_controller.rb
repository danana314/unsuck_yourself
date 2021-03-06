class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :current_user

  # before_action :test_flash
  # def test_flash
  #   flash[:notice] = 'TEST!'
  # end

  def current_user=(user)
    session[:user_id] = user.try(:id)
  end

  def current_user
    User.find_by(id: session[:user_id]) || nil
  end

  private

  def authenticate_user!
    if !onboarding_controllers? && !current_user
      redirect_to new_login_path, alert: 'Please sign in, friend.'
    end
  end

  def onboarding_controllers?
    controller_name == :logins.to_s ||
      controller_name == :sessions.to_s ||
      controller_name == :registrations.to_s
  end
end
