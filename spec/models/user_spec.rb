require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid user factory" do
    user = FactoryGirl.build(:user)
    user.should be_valid
  end
end
