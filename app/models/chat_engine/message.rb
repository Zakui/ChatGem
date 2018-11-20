module ChatEngine
  class Message < ApplicationRecord
    belongs_to :sender, polymorphic: true
    belongs_to :chat
    after_create_commit :jobs
    after_create_commit :send_message_notification
    
    has_attached_file :document
    validates_attachment :document,
    content_type: { content_type: ["application/pdf",'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', "image/jpeg", "image/gif", "image/png", "image/jpg", "image/bmp"] }
  
    def jobs
      MessageSendingJob.perform_later(self)
    end
    
    def send_message_notification
      message = self
      chat = message.chat
      recipient_user = chat.chat_subscribers.select{|p| p.subscriber!= message.sender }.first.subscriber
      excluding_me = chat.messages.where.not(id: message.id)
      if excluding_me.blank?
          ChatMailer.message_mail(message,recipient_user).deliver_later
      else
          chat_last_message = excluding_me.order('created_at DESC').first if not excluding_me.blank?
          time_diff = message.created_at - chat_last_message.created_at
          time_diff_min = time_diff.to_i/60
          if time_diff_min >= 10
            ChatMailer.message_mail(message,recipient_user).deliver_later
          end
      end
            
        
   end
    
    
    
  end
end
