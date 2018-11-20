class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :chat_subscribers, as: :subscriber, class_name: 'ChatEngine::ChatSubscriber'
  has_many :chats, through: :chat_subscribers, class_name: 'ChatEngine::Chat'
  has_many :messages, as: :sender, class_name: 'ChatEngine::Message'
  
  # def chat_with(user_id)
  #   return self.chats.includes(:chat_subscribers).select{|chat| chat.chat_subscribers.pluck(:subscriber_type).include?(user_id) } 
  # end
  
  def fullname
    (User.column_names.include? "name") ? self.name: self.email.split('@')[0]
  end
end
