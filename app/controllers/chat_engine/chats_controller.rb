require_dependency "chat_engine/application_controller"

module ChatEngine
  class ChatsController < ApplicationController
    before_action :set_chat, only: [:show, :edit, :update, :destroy]
    authorize_resource
    # GET /chats
    def index
      @chats = Chat.all
    end

    # GET /chats/1
    def show
      @messages = @chat.messages.order('created_at ASC')
      @message = Message.new
      @messages.where.not(sender: current_user).update_all(read: true)
    end
    
    def inbox
      all_messages = []
      current_user.chats.includes(:messages).each do |chat|
        all_messages << chat.messages.order('created_at ASC').last
      end
      # if 
      @chats = all_messages.compact.sort_by{|a| a.created_at }.reverse.map(&:chat)
    end

    # GET /chats/new
    # def new
    #   @chat = Chat.new
    # end

    # # GET /chats/1/edit
    # def edit
    # end

    # POST /chats
    def create
      @chat = current_user.chats.includes(:chat_subscribers).select{|chat| chat.chat_subscribers.pluck(:subscriber_type,:subscriber_id).include?([ params[:user_type].to_s, params[:user_id].to_i ]) }
      
      # chatwith = User.find(params[:user_id])
      # @chat = Chat.chat_with(current_user,chatwith)
      # byebug
      if not @chat.blank?
        redirect_to @chat.first
      else
        @chat = Chat.new(chat_params)
        @chat.chat_subscribers.new(subscriber: current_user)
        @chat.chat_subscribers.new(subscriber_type: params[:user_type],subscriber_id: params[:user_id])
    
        respond_to do |format|
          if @chat.save
            format.html { redirect_to @chat, notice: 'Chat was successfully created.' }
            format.json { render :show, status: :created, location: @chat }
          else
            format.html { render :new }
            format.json { render json: @chat.errors, status: :unprocessable_entity }
          end
        end
        
      end
    end

    # PATCH/PUT /chats/1
    # def update
    #   if @chat.update(chat_params)
    #     redirect_to @chat, notice: 'Chat was successfully updated.'
    #   else
    #     render :edit
    #   end
    # end

    # DELETE /chats/1
    def destroy
      @chat.destroy
      redirect_to chats_url, notice: 'Chat was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_chat
        @chat = Chat.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def chat_params
        params.fetch(:chat, {})
      end
  end
end
