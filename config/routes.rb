Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   devise_for :users

   resources :books do
    resources :book_comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
   end

   root'books#index'

   get '/top' => "books#top"

   get '/about' => "books#about"

   resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
   end

   get 'search' => 'searches#search', as: 'search'

end