Rails.application.routes.draw do
  devise_for :users
  root to: "managers#top"
   devise_for :managers, :controllers => {
    :sessions => 'managers/sessions',
    :registrations => 'managers/registrations',
  }
  
  resources :groups
end
