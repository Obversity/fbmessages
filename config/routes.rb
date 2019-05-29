Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :conversations do
    resources :messages do
      collection do
        get :stats
        get 'word-cloud', to: 'messages#word_cloud'
      end
    end
  end

  root to: 'conversations#index'
end
