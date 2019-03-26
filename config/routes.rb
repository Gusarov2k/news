Rails.application.routes.draw do
  resources :top_news
  root 'top_news#index'
end
