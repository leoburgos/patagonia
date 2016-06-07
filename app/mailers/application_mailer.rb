class ApplicationMailer < ActionMailer::Base
  default from: 'lburgosabal@gmail.com'

  def patagonia_bonus(user_emails, email_body, email_subject)
    @bonus_code = email_body
    attachments["todo.pdf"] = WickedPdf.new.pdf_from_string(
        render_to_string(pdf: 'todo', template: 'application_mailer/bonus.html.erb', layout: 'layouts/mail_pdf.pdf.erb'), {  }
    )
    mail(to: user_emails, subject: email_subject)
  end

end
