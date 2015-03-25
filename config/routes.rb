require 'sidekiq/web'

Rails.application.routes.draw do
  resources :users
  resources :delta

  root to: 'delta#show'
  mount Sidekiq::Web, at: '/sidekiq'
end
