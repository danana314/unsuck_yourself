class ApplicationMailer < ActionMailer::Base
  default from: 'UnsuckYourself at Math <no_reply@unsuckyourself.com>'
  layout 'mailer'


  def send_simple_message
    RestClient.post "https://api:key-45313470ece59b7a58431f77c7ea47ed",
      "@api.mailgun.net/v3/sandboxf496aacae2b1464583cff8a0ab0eba86.mailgun.org/messages",
      :from => "Mailgun Sandbox <postmaster@sandboxf496aacae2b1464583cff8a0ab0eba86.mailgun.org>",
      :to => "Dan Lawler <dan.r.lawler@gmail.com>",
      :subject => "Hello Dan Lawler",
      :text => "Congratulations Dan Lawler, you just sent an email with Mailgun!  You are truly awesome!"
  end

end
