Rails.application.routes.draw do
  namespace :member do
    get 'group_messages/show'
  end
  namespace :manager do
    get 'group_messages/index'
  end
  namespace :manager do
    get 'tasks/show'
    get 'tasks/create'
    get 'tasks/update'
    get 'tasks/destroy'
  end
 root to: "manager/managers#top"
   devise_for :managers, :controllers => {
    :sessions => 'managers/sessions',
    :registrations => 'managers/registrations',
  }
    devise_scope :member do
      patch "members/confirmation", to: "members/confirmations#confirm"
    end
    
   devise_for :members, :controllers => {
    :confirmations => "members/confirmations",
    #:sessions => 'members/sessions',
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
#-------letter_opener----------
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
