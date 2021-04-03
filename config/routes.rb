Rails.application.routes.draw do
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
  
 end
end
