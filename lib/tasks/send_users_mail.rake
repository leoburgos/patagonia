desc "Envio de mails"
task send_users_mail: :environment do
  puts 'Enviando recordatorios'
  ApplicationMailer.patagonia_users(['lburgosabal@gmail.com'], 'Resumen de clientes', 'Resumen de clientes').deliver!
  puts 'Finaliza envio de recordatorios '
end
