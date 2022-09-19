Rails.application.routes.draw do
  # ユーザー用
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
 root to: 'public/homes#top'
 get 'about' => 'public/homes#about'

 namespace :public do
  resources :posts, only: [:index, :show, :edit, :new, :create, :destroy, :update] do
  resource :likes, only: [:create, :destroy]
end
  resources :users, only: [:show,:edit,:update]
  resources :ranks, only: [:index]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
