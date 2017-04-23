class RegistrationsController < ApplicationController
	include UsersHelper

	def new
		@user = User.new
	end

	def create
		@user = User.find_or_create_by(user_params)

		if @user.persisted?
			SendSignInEmail.new(@user).call
			redirect_to root_path, notice: 'Login link sended to your email'
		else
			render action: :new
		end
	end

end
