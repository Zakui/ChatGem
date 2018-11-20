module ChatEngine
  class ChatSubscriber < ApplicationRecord
    belongs_to :chat
    belongs_to :subscriber, polymorphic: true
  end
end
