Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do                       # usersリソースをRESTfullな構造にするためのコード。
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]    # editアクションのみaccount_activationsリソースを適用
  resources :users
  resources :password_resets,     only: [:new, :create, :edit, :update]     # password再設定用のリソースを適用
  resources :microposts,          only: [:create, :destroy]     # micropostsリソースをcreateとdestroyアクションにのみ適用
  resources :relationships,       only: [:create, :destroy]
end
