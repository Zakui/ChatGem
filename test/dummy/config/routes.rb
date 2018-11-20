require 'sidekiq/web'
Rails.application.routes.draw do
  # mount ActionCable.server => '/cable'
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users
  # root to =>  'home#home'
  root to: "home#home"
  mount ChatEngine::Engine => "/chat_engine"
end
