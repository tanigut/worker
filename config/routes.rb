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

  namespace :admin do
  	root to: "requests#top"
    resources :event_genres, only:[:index, :edit, :create, :update]
    resources :members, only:[:index, :edit, :create, :update]
  end

  scope module: :member do
    resource :member, only:[:show, :edit, :create, :update]
  end

end
