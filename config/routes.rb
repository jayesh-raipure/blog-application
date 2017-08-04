Rails.application.routes.draw do 

  devise_for :users
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'auth/:provider/callback', to: 'sessions#omniauthLogin'

  resources :users
  resources :posts do
    resources :comments
    get 'myposts', on: :collection, as: :myposts
  end

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  resources :social_login
  root 'posts#index'
end
