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
 #--------manager---------
 namespace :member do 
  resources :members
  resources :tasks
  resources :group_messages do
    resource :checks, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end  
 end
 #-------------------
end
