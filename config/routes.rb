Rails.application.routes.draw do

  root "top#index"
  get "about" => "top#about", as: "about"

  devise_for :admins,
  controllers: {
  	passwords: 'devise/admins/passwords',
  	sessions: 'devise/admins/sessions'
  }

  devise_for :members,
  controllers: {
  	passwords: 'devise/members/passwords',
  	registrations: 'devise/members/registrations',
  	sessions: 'devise/members/sessions'
  }

  resources :rooms, only: [:index, :show, :create] do
    resources :messages, only: [:create]
  end

  namespace :admin do
  	root to: "requests#top"
    get "search" => "searches#search"
    resources :event_genres, only:[:index, :edit, :create, :update]
    resources :members, only:[:index, :show, :create, :update]
    resources :requests, only:[:index, :edit, :update] do
      resources :reports, only:[:index, :show]#, shallow: true
    end
  end

  scope module: :member do
    get "request" => "requests#top"
    get "search" => "searches#search"
    resource :member, only:[:show, :edit, :create, :update]
    resources :requests, only:[:index, :new, :create, :edit, :update, :destroy] do
      resources :reports, only:[:show, :new, :create, :update]#, shallow: true
    end
  end

end
