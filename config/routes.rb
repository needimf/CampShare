Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'campgrounds#index'

  resources :users, only: [:new, :create] do
    resources :contributor_applications, only: [:new, :create, :update], shallow: true
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :campgrounds do
    resources :comments, except: [:index, :show, :new, :edit], shallow: true
    resources :impressions, except: [:show, :index, :destroy], shallow: true
  end
  get '/login', to: 'sessions#new'
  get '/admin', to: 'users#admin', as: :admin

end
