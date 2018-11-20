class CreateChatEngineMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :chat_engine_messages do |t|
      t.references :sender,polymorphic: true
      t.text :content
      t.integer :chat_id
      t.boolean :read, default: false
      t.timestamps
    end
  end
end
