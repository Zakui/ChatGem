module ChatEngine
  class MessageSendingJob < ApplicationJob
    queue_as :default

    def perform(message)
      # Do something later
      for_user = message.chat.chat_subscribers.select{|c| c.subscriber!=message.sender}.first
      # logger.info for_user
      
      ActionCable.server.broadcast "chat_#{message.chat_id}", {message: render_message(message), sender_type: message.sender.class.to_s,sender_id: message.sender.id}
      # if for_user
        ActionCable.server.broadcast "message_notification_#{[for_user.subscriber_type,for_user.subscriber_id].join("_")}",{notification: "You have recieved message from #{message.sender.fullname}"}
      # end/
    end
    
    private
     
    def render_message(message)
        ApplicationController.render partial: 'chat_engine/messages/message', locals: { message: message }
    end
  end
end
