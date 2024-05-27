Rails.application.routes.draw do


  devise_for :users
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  scope module: :public do
    get '/users/my_page', to: 'users#show'
    get '/users/information/edit', to: 'users#edit'
    patch '/users/information/edit', to: 'users#update'
    # resources :posts, only: [:new, :show, :create, :index, :edit, :update, :destroy]

  end

  namespace :public do
    resources :posts, only: [:new, :show, :create, :index, :edit, :update]
  end
  # namespace :public do
  #   resources :posts, only: [:new, :show, :create, :index, :edit, :update] do
  #     resources :post_comments, only: [:create, :destroy]
  #   end
  # end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  root to: 'homes#top'
  get "home/about"=>"homes#about"
  get "search" => "searches#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
