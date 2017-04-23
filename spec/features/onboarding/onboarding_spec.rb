require 'rails_helper'

feature 'User onboarding:' do

	let(:new_email){'test@test.com'}
	let(:new_username){'testOrDie'}

	feature 'A user creates an account' do

		scenario 'successfully' do
			get_waiting_emails_count

			visit new_registration_path
			fill_in 'user_email', with: new_email
			fill_in 'user_username', with: new_username
			click_button 'Signup and send login link'

			assert_emails_sent_to_users_emails([new_email], @waiting_emails_count)
		end

		scenario 'unsuccsesfully' do

		end
	end

	feature 'A user signs in' do
		scenario 'via email successfully' do

		end

		scenario 'via username successfully' do

		end

		scenario 'unsuccsesfully' do

		end
	end

	feature 'A follows sign_in_email link' do
		scenario 'and signs in successfully' do

		end

		scenario 'after token has expired' do

		end
	end



	def expect_sign_in_email_to_be_sent
		###
	end

	def get_waiting_emails_count
		@waiting_emails_count = ActionMailer::Base.deliveries.length
	end

end