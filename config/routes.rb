Rails.application.routes.draw do
  root to: "managers#top"
   devise_for :managers, :controllers => {
    :sessions => 'managers/sessions',
    :registrations => 'managers/registrations',
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
