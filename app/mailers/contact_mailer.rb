class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact.contact.subject
  #
  def contact(contact)
    @greeting = "Hi"
    @subject = contact.subject
    @name = contact.name
    @email = contact.email
    @message = contact.message
    mail(
      to:       "acardnicolas@hotmail.com",
      subject:  "Subject #{@subject} de #{@name}!"
    )
  end
end
