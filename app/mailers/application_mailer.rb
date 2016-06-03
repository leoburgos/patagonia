class ApplicationMailer < ActionMailer::Base
  default from: 'lburgosabal@gmail.com'

  def patagonia_bonus(user_emails, email_body, email_subject)
    @email_body = email_body
    mail(to: user_emails, subject: email_subject)
  end

end
