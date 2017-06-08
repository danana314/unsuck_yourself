require 'rails_helper'

RSpec.describe SignInNudgeEmailJob, type: :job do
  include ActiveJob::TestHelper

  scenario 'Perform sends emails and does not blow up' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    user3 = FactoryGirl.create(:user)
    user4 = FactoryGirl.create(:user)

    expect(User.count).to eq 4

    get_waiting_emails_count

    SignInNudgeEmailJob.perform_now

    assert_emails_sent_to_users([user1, user2, user3, user4], @waiting_emails_count)
  end

end
