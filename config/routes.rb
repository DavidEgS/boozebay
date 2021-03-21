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
  # mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  scope :api, defaults: { format: :json } do
    devise_for :users
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :listings, only: %I[index show create update]
      resources :sessions, only: [ :create, :delete ]
      resources :bids, only: %I[show create update]
      post 'login', to: 'sessions#login'
      get 'pages/profile', to: 'pages#profile'
    end
  end
  get 'pages/:id/pdf', to: 'pages#pdf'

end
