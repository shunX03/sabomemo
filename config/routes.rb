Rails.application.routes.draw do
  get 'public/userranks'
  # ユーザー用
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

 root to: 'public/homes#top'
 get 'about' => 'public/homes#about'

  scope module: :public do
  resources :posts, only: [:index, :edit, :new, :create, :destroy, :update] do
  resource :likes, only: [:create, :destroy]
end
  resources :users, only: [:show,:edit,:update]
  resources :ranks, only: [:index,]
  resources :myranks, only: [:index,]
  resources :charts, only: [:index]
  resources :completions, only: [:index]
  resources :completions2, only: [:index]
  resources :completions3, only: [:index]
  resources :completions4, only: [:index]
  resources :completions5, only: [:index]
  resources :completions6, only: [:index]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
