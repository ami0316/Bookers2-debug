Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  
  root :to =>"homes#top"
  get "home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
     resource :favorite, only: [:create, :destroy]
   end
  resources :users, only: [:index,:show,:edit,:update]
  resources :books, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create]
  end
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  

end