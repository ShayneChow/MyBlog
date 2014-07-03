MyBlog::Application.routes.draw do

  root 'home#index'
  get 'tags/:tag', to: 'posts#index', as: :tag
  get 'about' => 'home#about', :as => 'about'
  resources :posts

  # 后台路由
  namespace :admin do
    root :to => 'home#index'
    resources :posts

    #用户登录与注销
    resources :sessions
    get 'login' => 'sessions#new', :as => 'login'
    post 'login' => 'sessions#create', :as => 'post_login'
    get 'logout' => 'sessions#destroy', :as => 'logout'
  end


end
