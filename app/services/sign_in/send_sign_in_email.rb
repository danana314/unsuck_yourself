class SendSignInEmail < ServiceBase

	def initialize (user)
		@user = user
	end

	def call
		@user.update!(login_token: SecureRandom.urlsafe_base64,
		             login_token_valid_until: Time.now + 15.minutes)
		UserMailer.login_link(@user).deliver
	end
end
