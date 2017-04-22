FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "testtest#{n}@test.com" }
    sequence(:username) { |n| "UserName#{n}" }
    login_token "MyString"
    login_token_valid_until Time.now + 15.minutes
  end
end
