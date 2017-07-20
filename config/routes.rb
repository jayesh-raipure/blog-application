Rails.application.routes.draw do 

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'auth/:provider/callback', to: 'sessions#omniauthLogin'

  resources :users
  resources :posts do
    resources :comments
  end

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  root 'posts#index'
end
