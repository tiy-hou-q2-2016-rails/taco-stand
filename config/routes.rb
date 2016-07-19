Rails.application.routes.draw do


  root 'welcome#homepage'

  get 'tacos' => 'welcome#homepage', as: :tacos
  post 'tacos' => 'tacos#create'
  get 'tacos/new' => 'tacos#new', as: :new_taco
  get 'tacos/:id' => 'tacos#show', as: :taco
  get 'tacos/:id/edit' => 'tacos#edit', as: :edit_taco
  delete 'tacos/:id' => 'tacos#delete'
  patch 'tacos/:id' => 'tacos#update'

  get 'tacos/:taco_id/sharing/new' => 'sharing#new', as: :new_share
  post 'tacos/:taco_id/sharing' => 'sharing#create', as: :create_share
  get 'sharing/thanks' => 'sharing#thanks', as: :thanks_for_sharing

  get 'sign_in' => 'sessions#new', as: :sign_in
  post 'sign_in' => 'sessions#create'
  delete 'sign_in' => 'sessions#delete'

  get 'registration' => 'users#new', as: :new_user
  post 'registration' => 'users#create', as: :create_user

  get 'passwords/new' => 'passwords#new', as: :new_password
  post 'passwords' => 'passwords#create', as: :create_password
  get 'passwords/reset/:token' => 'passwords#reset', as: :reset_password
  patch 'passwords/reset/:token' => 'passwords#update'


  get 'users' => 'users#index', as: :users
  get 'entourage' => 'users#following', as: :following
  post 'follow/:user_id' => 'users#follow', as: :follow
  post 'unfollow/:user_id' => 'users#unfollow', as: :unfollow

  get 'feed' => 'tacos#feed', as: :feed

  get 'tacos/:taco_id/charges/new' => 'charges#new', as: :new_charge
  post 'tacos/:taco_id/charges' => 'charges#create', as: :process_charge

  get 'api/tacos' => 'api/tacos#index', as: :api_tacos
  get 'api/tacos/:id' => 'api/tacos#show', as: :api_taco
  post 'api/tacos' => 'api/tacos#create'
  delete 'api/tacos/:id' => 'api/tacos#delete'

end
