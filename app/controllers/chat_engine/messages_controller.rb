require_dependency "chat_engine/application_controller"

module ChatEngine
  class MessagesController < ApplicationController
    before_action :set_chat
    def create
      @message = @chat.messages.new(message_params)
      respond_to do |format|
          if @message.save
            format.html { redirect_to @chat, notice: 'Message was successfully created.' }
            format.js
          else
            format.html { redirect_to @chat, notice: 'Something went wrong.' }
            format.js
          end
        end
    end
    
    private
    
    def set_chat
      @chat = Chat.find(params[:chat_id])
    end
    
    def message_params
      params.require(:message).permit(:content,:sender_id,:sender_type,:document)
    end
  end
end
