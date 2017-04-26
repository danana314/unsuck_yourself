require 'rails_helper'

describe Engine::Vanilla do

	let(:user){FactoryGirl.create(:user)}
	let(:workout){FactoryGirl.create(:workout, user: user)}

	context "#initialize" do
		xit 'does something' do
			#Engine::Base.new()
		end
	end
end
