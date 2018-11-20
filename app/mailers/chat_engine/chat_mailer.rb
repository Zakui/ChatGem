module ChatEngine
  class ChatMailer < ApplicationMailer
    def message_mail(message,recipient_user)
      email_subject = 'You have Recieved a new Message'
      @message = message
      mail(to: recipient_user.email, subject: email_subject)
    end
  end
end
