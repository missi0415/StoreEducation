Rails.application.routes.draw do
  get 'rooms/show'
 root to: "homes#top"
 get 'homes/about'
# ゲストログイン
devise_scope :manager do
post 'managers/guest_sign_in', to: 'managers/sessions#guest_sign_in'
 end
 
   devise_for :managers, :controllers => {
    :sessions => 'managers/sessions',
    :registrations => 'managers/registrations',
  }
   devise_for :members, :controllers => {
    :sessions => 'members/sessions',
    :registrations => 'members/registrations',
  }
  
 #-------chatroom----------
   resources :rooms, :only => [:show, :create] do
    resources :messages, :only => [:create]
  end
 #-------------------------
  
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
  resources :members,only:[:index,:update,:destroy,]
  resources :tasks, only: [:destroy ,:update]
  resources :educations, only: [:destroy ,:update]
  resources :group_messages do
    resource :checks, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end  
 end
 #-------------------
end
