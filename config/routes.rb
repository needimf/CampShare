Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'campgrounds#index'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :campgrounds do
    resources :comments, except: [:index, :show], shallow: true
    resources :impressions, except: [:show], shallow: true
  end
  
end