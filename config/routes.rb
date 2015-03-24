Rails.application.routes.draw do
  get 'delta/new'
  get 'delta/update'
  get 'delta/edit'
  resources :users
  resources :delta
end
