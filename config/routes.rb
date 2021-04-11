Rails.application.routes.draw do
 root to: "homes#top"
 get 'homes/about'
 
   devise_for :managers, :controllers => {
    :sessions => 'managers/sessions',
    :registrations => 'managers/registrations',
  }
   devise_for :members, :controllers => {
    :sessions => 'members/sessions',
    :registrations => 'members/registrations',
  }
  
 #--------manager---------
 namespace :manager do 
  resources :managers
  resources :groups
  resources :members
  resources :educations
  resources :tasks
  resources :abilities
  resources :group_messages
  resources :ability_titles
 end
 #-------------------
 #--------member---------
 namespace :member do 
  #デバイスサインアップ 
  #get '/users', to: redirect("/users/sign_up") 
  resources :members
  resources :tasks, only: [:create, :destroy ,:update]
  resources :educations, only: [:create, :destroy ,:update]
  resources :group_messages do
    resource :checks, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end  
 end
 #-------------------
end
