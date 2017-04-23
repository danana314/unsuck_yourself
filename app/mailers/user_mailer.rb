class UserMailer < ApplicationMailer

	include UsersHelper

	def login_link(user)
		@user = user
		@sign_in_path = sign_in_url_from_email @user

		mail to: @user.email, subject: 'Sign-in into someapp.com'
	end

end
