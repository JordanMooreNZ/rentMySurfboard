Rails.application.routes.draw do

  resources :bookings, only: [:index, :update]

  resources :surfboards do
    collection do
      get 'my_boards'
    end
    resources :bookings, only: [:new, :create, :update]
  end
  # get 'surfboards/myboards', to: 'surfboards#my_boards', as: :my_boards
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
