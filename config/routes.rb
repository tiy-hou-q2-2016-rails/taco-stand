Rails.application.routes.draw do
  root 'welcome#homepage'

  get '/tacos/:id' => 'tacos#show', as: :taco
end
