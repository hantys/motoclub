Rails.application.routes.draw do
  resources :elections, except: [:show, :new, :create]
  devise_for :users

  post '/votacao/:id' => 'elections#vote', as: :vote

  root 'elections#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
