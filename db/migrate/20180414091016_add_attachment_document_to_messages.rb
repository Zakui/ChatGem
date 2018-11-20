class AddAttachmentDocumentToMessages < ActiveRecord::Migration[5.1]
  def self.up
    change_table :chat_engine_messages do |t|
      t.attachment :document
      # t.attachment :image
    end
    # add_attachment :chat_engine_messages, :document
  end

  def self.down
    remove_attachment :chat_engine_messages, :document
  end
end
