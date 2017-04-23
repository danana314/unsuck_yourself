require 'rails_helper'
include UsersHelper

feature 'User onboarding:' do

	let(:new_email){'test@test.com'}
	let(:new_username){'testOrDie'}
	let(:success_flash_message){'Sweet. Login link sent to your email.'}
	let(:failure_flash_message){'Invalid email or username'}


	feature 'A user creates an account' do

		scenario 'successfully' do
			get_waiting_emails_count

			visit new_registration_path
			fill_in 'user_email', with: new_email
			fill_in 'user_username', with: new_username
			click_button 'Signup and send login link'

			assert_emails_sent_to_users_emails([new_email], @waiting_emails_count)
			expect(page).to have_content success_flash_message
		end

		feature 'unsuccessfully' do

			let(:other_user){FactoryGirl.create(:user)}

			scenario 'with other user\'s email' do
				visit new_registration_path
				fill_in 'user_email', with: other_user.email
				fill_in 'user_username', with: new_username
				click_button 'Signup and send login link'
				expect(page).to have_content failure_flash_message
			end
		end
	end

	feature 'A user signs in via logins page' do

		let(:user){FactoryGirl.create(:user)}

		scenario 'via email successfully' do
			visit new_login_path

			fill_in 'user_email_or_username', with: user.email
			click_button 'Send login link'
			expect(page).to have_content success_flash_message
		end

		scenario 'via username successfully' do
			visit new_login_path

			fill_in 'user_email_or_username', with: user.username
			click_button 'Send login link'
			expect(page).to have_content success_flash_message
		end

		scenario 'unsuccsesfully' do
			visit new_login_path

			fill_in 'user_email_or_username', with: 'something_that_does_not_exist'
			click_button 'Send login link'
			expect(page).to have_content 'Could not find you account. Have you signed up yet?'
		end
	end

	feature 'Follows link in sign in email' do
		let(:user){FactoryGirl.create(:user)}

		scenario 'and signs in successfully' do
			generated_sign_in_url = sign_in_url_from_email(user)
			visit generated_sign_in_url

			expect(page).to have_content('Signed-in successfully')
		end

		scenario 'and is unsuccessful if email link is followed twice' do
			generated_sign_in_url = sign_in_url_from_email(user)
			visit generated_sign_in_url
			expect(page).to have_content('Signed-in successfully')
			visit generated_sign_in_url
			expect(page).to have_content('Invalid or expired login link')
		end

		scenario 'and is unsuccessful if login token has expired' do
			user.update_attribute(:login_token_valid_until, Time.now - 5.minutes)
			generated_sign_in_url = sign_in_url_from_email(user)
			visit generated_sign_in_url
			expect(page).to have_content('Invalid or expired login link')
		end
	end



	def expect_sign_in_email_to_be_sent
		###
	end

end