module FeaturesSpecHelper

	def assert_emails_sent_to_users(users_array, pre_event_waiting_deliveries = nil, admin_notification_sent = false)
    email_array = users_array.map {|u| u.email}
    if admin_notification_sent
      email_array += User.admin_notification_emails
    end
    assert_emails_sent_to_users_emails(email_array, pre_event_waiting_deliveries)
  end

	def assert_emails_sent_to_users_emails(email_array, pre_event_waiting_deliveries = nil)
    ActionMailer::Base.deliveries.last(email_array.length).each do |email|
      expect(email_array.include? email.to.first).to eq(true)
    end
    if pre_event_waiting_deliveries
      assert_number_of_emails_sent(pre_event_waiting_deliveries, email_array.length)
    end
  end

	def assert_number_of_emails_sent(pre_event_waiting_deliveries, expected_number_sent)
    expect(ActionMailer::Base.deliveries.length).to eq (pre_event_waiting_deliveries + expected_number_sent)
  end

	def get_waiting_emails_count
		@waiting_emails = ActionMailer::Base.deliveries.length
	end

end
