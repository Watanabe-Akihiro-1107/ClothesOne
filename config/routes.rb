Rails.application.routes.draw do

  namespace :user do
    get 'inquiries/new'
    get 'inquiries/create'
  end
  namespace :admin do
    resources :users, only:[:index,:update,:edit]
    get'top' => 'users#top'
  end

  namespace :user do
    get 'favorites/create'
    get 'favorites/destroy'
  end
  namespace :user do
    get 'item_comments/create'
    get 'item_comments/destroy'
  end
    devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
    omniauth_callbacks: "users/omniauth_callbacks"
    }

    devise_for :admins

    root to: "user/items#top"

  scope module: :user do
    resources :notifications, only: :index
    delete "notifications/destroy_all" => "notifications/destroy_all"
  end

  scope module: :user do
    get "search" => "items#search"
    resources :items,only:[:index,:create,:destroy,:edit,:update, :new ,:show] do
      resources :item_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
  end
  end

  scope module: :user do
    resources :categories,only:[:index,:create]
  end

  scope module: :user do
    resources :brands,only:[:index, :create, :show]
  end

  scope module: :user do
    resources :inquiries,only:[:new, :create ]
    get 'inquiries/complete' => 'inquiries#complete'
  end


  scope module: :user do
    resources :users,only:[:show,:edit,:update,:edit] do
    resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
    member do
      resources :favorites, only:[:index]
    end
  end
  end




  namespace :admin do
    resources :categories, only:[:index,:update,:create,:edit,:destroy]
  end

  namespace :admin do
    resources :brands, only:[:index,:update, :create,:edit,:destroy]
  end

  scope module: :user do
    get 'about' => "users#about"
    get 'delete_page' => "users#delete_page"
    patch 'withdraw' => "users#withdraw"
  end
end

