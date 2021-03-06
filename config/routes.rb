Rails.application.routes.draw do
  resources :web_push_notifications
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :subscriptions, only: :create
    end
  end

  root "web_push_notifications#index"
end
