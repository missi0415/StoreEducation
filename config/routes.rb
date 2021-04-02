Rails.application.routes.draw do
  root to: "managers#top"
   devise_for :managers, :controllers => {
    :sessions => 'managers/sessions',
    :registrations => 'managers/registrations',
  }
   devise_for :members, :controllers => {
    :sessions => 'members/sessions',
    :registrations => 'members/registrations',
  }
  resources :groups
  resources :members
end
