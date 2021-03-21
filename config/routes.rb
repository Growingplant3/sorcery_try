Rails.application.routes.draw do
  root 'users#index'
  get :login, to: 'user_sessions#new'
  delete :logout, to:  'user_sessions#destroy'

  # resources :users
  resources :users do
    member do
      get :activate
    end
  end
  resources :user_sessions, only: %i[create]
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
