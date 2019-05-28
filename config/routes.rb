Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :conversations do
    resources :messages do
      collection do
        get :stats
      end
    end
  end

  root to: 'conversations#index'
end
