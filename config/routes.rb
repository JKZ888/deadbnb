Rails.application.routes.draw do

  resources :graveyards, only: [:index] do
    resources :tombs, only: [:index]
  end
  resources :tombs, only: [:new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :edit, :update, :destroy]
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

