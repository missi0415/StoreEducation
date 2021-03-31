Rails.application.routes.draw do
  root to: "managers#top"
   devise_for :managers, :controllers => {
    :sessions => 'managers/sessions',
    :registrations => 'managers/registrations',
  }
  
  resources :groups
end
