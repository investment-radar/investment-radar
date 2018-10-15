# == Route Map
#
# Prefix Verb URI Pattern Controller#Action
#   root GET  /           welcome#index
#

Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :stocks
    resources :watchlists
    resources :buy_in_stocks
    resources :long_term_stocks

    root to: "users#index"
  end

  resources :weekly_charts, only: :index
  resources :daily_charts, only: :index

  resources :positions, only: :index
  patch '/positions/:id/ack', to: 'positions#ack', as: 'ack_stock'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
