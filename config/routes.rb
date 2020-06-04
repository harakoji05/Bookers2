Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   devise_for :users

   resources :books do
    resource :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
   end

   root'books#top'

   get '/home/about' => "books#about"

   resources :users

   resources :relationships, only: [:create, :destroy]

   get '/users/:id/following' => "users#following", as: 'following_user'

   get '/users/:id/followers' => "users#followers", as: 'followers_user'
end
