Rails.application.routes.draw do
  # get 'monsters/noah'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session, only: [:new, :create, :destroy]

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :users do
        resources :combats
      end
      resources :tokens, only: [:create]
      resources :monsters, only: [:index]
    end
  end
end
