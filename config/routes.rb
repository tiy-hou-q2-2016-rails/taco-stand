Rails.application.routes.draw do
  root 'welcome#homepage'

  get 'tacos' => 'welcome#homepage', as: :tacos
  post 'tacos' => 'tacos#create'
  get 'tacos/new' => 'tacos#new', as: :new_taco
  get 'tacos/:id' => 'tacos#show', as: :taco

end
