class ApplicationMailer < ActionMailer::Base
  default from: 'lburgosabal@gmail.com'

  def patagonia_bonus(user_emails, email_body, email_subject)
    @bonus_code = email_body
    #file = File.join(Rails.root, 'app', 'assets', 'images', 'vale.jpg')
    #kit = IMGKit.new(File.new(file))
    attachments["vale.pdf"] = #kit
    WickedPdf.new.pdf_from_string(
       render_to_string(pdf: 'vale', template: 'application_mailer/bonus.html.erb', layout: 'layouts/mail_pdf.pdf.erb'), {  }
    )
    mail(to: user_emails, subject: email_subject)
  end

  def patagonia_users(user_emails, email_body, email_subject)
      users = User.all
      attachments['Clientes.xls'] = users.to_xls(:columns => [:name, :mail, :tel, :return_rate, :recommendation_rate, :suggestions, :birth_date, :created_at],
                                               :headers => ['Nombre', 'Mail', 'Teléfono', 'Volverías?', 'Recomendarías?', 'Sugerencias', 'Fecha de Nacimiento', 'Fecha de registro'])
      mail(to: user_emails, subject: email_subject)
  end

end
