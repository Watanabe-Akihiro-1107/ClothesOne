Rails.application.routes.draw do

    devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
    }
    devise_for :admins

    root to: "user/items#top"

 

  scope module: :user do
    resources :items,only:[:index,:create,:destroy,:edit,:update, :new ,:show]
  end

  scope module: :user do
    resources :categories,only:[:index,:create]
  end

  scope module: :user do
    resources :brands,only:[:index, :create]
  end

  scope module: :user do
    resources :users,only:[:show,:edit,:update]
    get 'delete_page' => "users#delete_page"
    patch 'withdraw' => "users#withdraw"
  end


  namespace :admin do
    resources :categories, only:[:index,:update,:create,:edit]
  end

  namespace :admin do
    resources :brands, only:[:index,:update, :create,:edit]
  end


end

