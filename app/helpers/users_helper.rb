module UsersHelper

	def user_params
		params.require(:user).permit(:email, :username, :email_or_username)
	end

end
