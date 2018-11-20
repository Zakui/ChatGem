ChatEngine::Engine.routes.draw do
  # mount ActionCable.server => '/cable'
  authenticate :user do
    get 'inbox',to: 'chats#inbox'
    resources :chats, except:[:edit,:new,:update] do
      resources :messages, only: [:create]
    end
  end
end
