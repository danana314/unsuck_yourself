require 'rails_helper'

feature 'Admin dashboard' do

	let(:user){FactoryGirl.create(:user)}
	let(:admin){FactoryGirl.create(:admin_user)}

	feature 'access' do
		scenario 'is granted for admin user' do
			sign_in admin
			visit rails_admin_path
			expect(page).to have_content 'Site Administration'
			expect(page).to_not have_current_path root_path
		end

		scenario 'is denied for normal user' do
			sign_in user
			visit rails_admin_path
			expect(page).to have_content 'That page does not exist.'
			expect(page).to have_current_path root_path
		end

	end

end