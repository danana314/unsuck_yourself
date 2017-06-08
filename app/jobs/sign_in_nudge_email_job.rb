class SignInNudgeEmailJob < ApplicationJob

	queue_as :default

	def perform(*args)

		# TODO filter by subscribed OR not
		User.all.find_each(batch_size: 100) do |user|
			user.generate_new_login_token!
			UserMailer.sign_in_nudge(user).deliver_now
		end

		true

	end

end
