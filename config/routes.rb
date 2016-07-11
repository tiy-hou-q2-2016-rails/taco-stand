Rails.application.routes.draw do
  root 'welcome#homepage'

  resources :tacos
  resources :menus


  get 'sign_in' => 'sessions#new', as: :sign_in
  post 'sign_in' => 'sessions#create'
  delete 'sign_in' => 'sessions#delete'

  get 'registration' => 'users#new', as: :new_user
  post 'registration' => 'users#create', as: :create_user

  get 'users' => 'users#index', as: :users
  get 'entourage' => 'users#following', as: :following
  post 'follow/:user_id' => 'users#follow', as: :follow
  post 'unfollow/:user_id' => 'users#unfollow', as: :unfollow

  get 'feed' => 'tacos#feed', as: :feed

  namespace :api do
    resources :tacos, only: [:index, :show, :create, :destroy]

      # get 'tacos' => 'tacos#index', as: :tacos
      # get 'tacos/:id' => 'tacos#show', as: :taco
      # post 'tacos' => 'tacos#create'
      # delete 'tacos/:id' => 'tacos#delete'
  end


end
