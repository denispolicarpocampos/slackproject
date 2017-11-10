Rails.application.routes.draw do
  root to: 'teams#index'
  get '/:slug', to: 'teams#show'

  resources :teams, only: [:create, :destroy] do
    resources :invites, only: [:create, :show]
  end

  resources :channels, only: [:show, :create, :destroy]
  resources :talks, only: [:show]
  resources :team_users, only: [:create, :destroy]
  devise_for :users, :controllers => { registrations: 'registrations' }
  mount ActionCable.server => '/cable'
end
