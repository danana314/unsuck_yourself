module UsersHelper

	def user_params
		params.require(:user).permit(:email, :username, :email_or_username)
	end

	def sign_in_url_from_email user
		new_session_url(token: user.login_token)
	end

end
