Rails.application.routes.draw do
  use_doorkeeper
  root 'welcome#homepage'

  get 'tacos' => 'welcome#homepage', as: :tacos
  post 'tacos' => 'tacos#create'
  get 'tacos/new' => 'tacos#new', as: :new_taco
  get 'tacos/:id' => 'tacos#show', as: :taco
  get 'tacos/:id/edit' => 'tacos#edit', as: :edit_taco
  delete 'tacos/:id' => 'tacos#delete'
  patch 'tacos/:id' => 'tacos#update'

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


  get 'api/tacos' => 'api/tacos#index', as: :api_tacos
  get 'api/tacos/:id' => 'api/tacos#show', as: :api_taco
  post 'api/tacos' => 'api/tacos#create'
  delete 'api/tacos/:id' => 'api/tacos#delete'
  post 'api/registration' => 'api/registration#create'

end
