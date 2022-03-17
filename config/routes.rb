Rails.application.routes.draw do
  #get 'users/index'
  #get 'users/show'
  #get 'users/edit'
  devise_for :users
  root to:'homes#top'
  resources :books,only:[:index,:show,:edit,:create]
  resources :users,only:[:index,:show,:edit]
  get "/homes/about" => "homes#about", as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
