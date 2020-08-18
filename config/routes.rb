Rails.application.routes.draw do
  # devise_for :users do
  #  get '/users/sign_out' => 'devise/sessions#destroy'
  # end

  # devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :meals, only: [:new, :create, :update, :edit, :index, :show, :destroy] do
    resources :comments, only: [:new, :create, :update, :edit, :index, :show, :destroy]
  end
  resources :meal_foods, only: [:new, :create, :update, :edit, :index, :show]
  resources :foods, only: [:new, :create, :update, :edit, :index, :show] 
  get '/meals/new', to: 'meals#new'
  

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
end
