class CreateChatEngineChats < ActiveRecord::Migration[5.1]
  def change
    create_table :chat_engine_chats do |t|

      t.timestamps
    end
  end
end
