Rails.application.routes.draw do


  namespace :user do
    get 'item_comments/create'
    get 'item_comments/destroy'
  end
    devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
    }
    devise_for :admins

    root to: "user/items#top"

 

  scope module: :user do
    resources :items,only:[:index,:create,:destroy,:edit,:update, :new ,:show] do
      resources :item_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
  end
  end

  scope module: :user do
    resources :categories,only:[:index,:create]
  end

  scope module: :user do
    resources :brands,only:[:index, :create]
  end

  scope module: :user do
    resources :users,only:[:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
  end
  end


  namespace :admin do
    resources :categories, only:[:index,:update,:create,:edit]
  end

  namespace :admin do
    resources :brands, only:[:index,:update, :create,:edit,:destroy]
  end

  scope module: :user do
    get 'delete_page' => "users#delete_page"
    patch 'withdraw' => "users#withdraw"
  end
end

