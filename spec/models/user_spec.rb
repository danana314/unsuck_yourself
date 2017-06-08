require 'rails_helper'

RSpec.describe User, type: :model do

	it "has a valid user factory" do
    user = FactoryGirl.build(:user)
    user.should be_valid
  end

  describe 'Associations' do
    it {should have_many(:skill_levels)}
    it {should have_many(:workouts)}
  end

  describe 'Validations' do
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_uniqueness_of(:username )}
  end

  describe 'generate_new_login_token!' do
    it 'generates a new login_token and a valid_until date 15.minutes from now' do
      user = FactoryGirl.create(:user)
      expect(user.login_token).to_not eq nil

      user.generate_new_login_token!

      first_token = user.login_token
      expect(user.login_token).to_not eq nil
      expect(user.login_token_valid_until > 14.minutes.from_now).to eq true
      expect(user.login_token_valid_until < 16.minutes.from_now).to eq true

      user.generate_new_login_token!
      user.reload

      expect(user.login_token).to_not eq nil
      expect(first_token).to_not eq user.login_token
      expect(user.login_token_valid_until > 14.minutes.from_now).to eq true
      expect(user.login_token_valid_until < 16.minutes.from_now).to eq true
    end
  end
end
