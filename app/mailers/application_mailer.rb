class ApplicationMailer < ActionMailer::Base
  default from: 'Monsieur Mode Shop ' << ENV['SUPPORT_EMAIL']
  layout 'mailer'
end
