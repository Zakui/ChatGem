class CreateChatEngineChatSubscribers < ActiveRecord::Migration[5.1]
  def change
    create_table :chat_engine_chat_subscribers do |t|
      t.references :subscriber, polymorphic: true,index: false
      t.integer :chat_id
      t.timestamps
    end
  end
end
