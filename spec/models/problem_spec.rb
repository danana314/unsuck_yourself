require 'rails_helper'

RSpec.describe Problem, type: :model do

  it "has a valid factory" do
    object = FactoryGirl.build(:problem)
    object.should be_valid
  end

  describe 'Associations' do
    it {should belong_to(:workout)}
  end

  describe 'Validations' do
    it {should validate_presence_of(:problem_type)}
    it {should validate_presence_of(:difficulty)}
    it {should validate_presence_of(:problem)}
    it {should validate_presence_of(:correct_answer)}
    it {should validate_presence_of(:workout)}
  end

end
