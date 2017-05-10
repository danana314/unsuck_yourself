require 'rails_helper'

RSpec.describe Workout, type: :model do

  it "has a valid factory" do
    object = FactoryGirl.build(:workout)
    object.should be_valid
  end

  describe 'Associations' do
    it {should belong_to(:user)}
    it {should have_many(:problems)}
  end

  describe 'Validations' do
    it {should validate_presence_of(:user)}
    it {should validate_presence_of(:progress)}
    it {should validate_presence_of(:workout_type)}
  end

end
