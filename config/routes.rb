Rails.application.routes.draw do
  resources :surfboards do
    collection do
      get 'my_boards'
    end
  end
  # get 'surfboards/myboards', to: 'surfboards#my_boards', as: :my_boards
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
