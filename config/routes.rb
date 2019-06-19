Rails.application.routes.draw do
  devise_for :users
  root to: 'playlists#index'
  resources :playlists, only: [ :index, :create, :new, :destroy ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
