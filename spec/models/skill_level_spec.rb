require 'rails_helper'

RSpec.describe SkillLevel, type: :model do

  it "has a valid factory" do
    object = FactoryGirl.build(:skill_level)
    object.should be_valid
  end

  describe 'Associations' do
    it {should belong_to(:user)}
  end

  describe 'Validations' do
    it {should validate_presence_of(:problem_type)}
    it {should validate_presence_of(:level)}
    it {should validate_presence_of(:user)}
  end

end
