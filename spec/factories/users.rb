FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "testtest#{n}@test.com" }
    sequence(:username) { |n| "UserName#{n}" }
    login_token "MyString"
    login_token_valid_until Time.now + 15.minutes

    factory :admin_user do |u|
      sequence(:email) { |n| "admin_user#{n}@test.com" }
      after(:create) do |user|
        user.add_role :admin
      end
    end

  end
end
