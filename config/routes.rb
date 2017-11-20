# == Route Map
#
# Prefix Verb URI Pattern Controller#Action
#   root GET  /           welcome#index
#

Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :long_term_stocks
    resources :stocks
    resources :buy_in_stocks

    root to: "users#index"
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
