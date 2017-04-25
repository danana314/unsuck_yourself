require 'rails_helper'

feature 'User edit:' do

	let(:user){FactoryGirl.create(:user)}

	feature 'Access to edit page' do

		scenario 'is granted for user' do
			sign_in user
			visit edit_user_path(user)
			expect(page).to have_current_path edit_user_path(user)
		end

		scenario 'is granted for admin' do
			admin = FactoryGirl.create(:admin_user)
			sign_in admin
			visit edit_user_path(user)
			expect(page).to have_current_path edit_user_path(user)
		end

		scenario 'is denied for another user' do
			other_user = FactoryGirl.create(:user)
			sign_in other_user
			visit edit_user_path(user)
			expect(page).to_not have_current_path edit_user_path(user)
		end

	end

end