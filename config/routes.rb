Rails.application.routes.draw do
  # devise_for :users,
  #              path: '',
  #              path_names: {
  #                sign_in: 'login',
  #                sign_out: 'logout',
  #                registration: 'signup'
  #              },
  #              controllers: {
  #                sessions: 'sessions',
  #                registrations: 'registrations'
  #              }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :listings, only: %I[index show create]
      resources :sessions, only: [ :create, :delete ]
      post 'login', to: 'sessions#login'
    end
  end
end
