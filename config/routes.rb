Rails.application.routes.draw do

  resources :bookings, only: [:index, :update]

  resources :surfboards do
    collection do
      get 'myboards', to: 'surfboards#my_boards', as: :my_boards
    end
    resources :bookings, only: [:new, :create, :update]
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
