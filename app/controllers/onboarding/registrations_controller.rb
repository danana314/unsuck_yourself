class Onboarding::RegistrationsController < ApplicationController
	include UsersHelper

	def new
		@user = User.new
	end

	def create
		@user = User.find_or_create_by(user_params)

		if @user.persisted?
			SendSignInEmail.new(@user).call
			redirect_to root_path, notice: 'Sweet. Login link sent to your email.'
		else
			flash[:alert] = 'Invalid email or username'
			render action: :new
		end
	end

end
