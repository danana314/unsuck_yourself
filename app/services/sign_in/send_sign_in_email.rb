class SendSignInEmail < ServiceBase

	def initialize user
		@user = user
	end

	def call
		@user.generate_new_login_token!
		UserMailer.login_link(@user).deliver
	end

end
