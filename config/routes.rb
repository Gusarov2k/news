Rails.application.routes.draw do
  resources :users, only: %i[show new edit create update]
  get '/sign_up', to: 'users#new', as: :sign_up

  resources :top_news
  root 'top_news#index'

  resources :sessions, only: %i[new create destroy]
  get '/log_in', to: 'sessions#new', as: :log_in
  delete '/log_out', to: 'sessions#destroy', as: :log_out
end
