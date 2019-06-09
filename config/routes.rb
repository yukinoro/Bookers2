Rails.application.routes.draw do
  
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
  end
  resources :users,only: [:index, :show, :edit, :update ]

  root to:'books#top'
  get "home/about" => "books#about"
  get "users/:id" => "users#show", as: :mypage
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
