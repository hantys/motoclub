Rails.application.routes.draw do
  resources :elections
  devise_for :users

  root 'elections#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
