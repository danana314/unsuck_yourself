require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid user factory" do
    user = FactoryGirl.build(:user)
    user.should be_valid
  end

  # describe 'Associations' do
  #   it {should belong_to(:your_mom)}
  # end

  describe 'Validations' do
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_uniqueness_of(:username )}
  end
end
