module ChatEngine
  class MessageChannel < ApplicationCable::Channel
    def subscribed
      stream_from "chat_#{params[:chat_id]}" if params[:chat_id]
      stream_from "message_notification_#{params[:user_id]}" if params[:user_id]
      # user = params[:user_id].split('_')
      # user[0].constantize.find(user[1].to_i).update(online:true) if params[:user_id]
      # logger.info params
    end

    def unsubscribed
      # Any cleanup needed when channel is unsubscribed
    end
  end
end
