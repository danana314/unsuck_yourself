class TestCronJob < ApplicationJob

	queue_as :default

	def perform(*args)

		ApplicationMailer.generic_email(user: User.with_role(:admin).first,
																		details: 'Test Cron Job Details',
																		title: 'Test Cron Job from UY').deliver_now

	end

end
