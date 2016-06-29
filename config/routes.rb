Rails.application.routes.draw do
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
end
