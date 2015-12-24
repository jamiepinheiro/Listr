Rails.application.routes.draw do

  devise_for :users
  get '' => 'lists#index'
  get 'lists/new' => 'lists#new'
  
  get 'lists/:id' => 'lists#show', as: :list

  post 'lists/edit/:id' => 'lists#edit'

  post 'lists' => 'lists#create'

  post 'lists/edit' => 'lists#update'

  resources :lists
end
