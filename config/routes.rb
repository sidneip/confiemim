Rails.application.routes.draw do
  resources :comments

  root to: 'visitors#index'
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}, :skip => [:sessions]
  as :user do
    get 'entrar' => 'devise/sessions#new', :as => :new_user_session
    post 'entrar' => 'devise/sessions#create', :as => :user_session
    match 'sair' => 'devise/sessions#destroy', :as => :destroy_user_session,
      :via => Devise.mappings[:user].sign_out_via
  end
  resources :users
  get 'cadastro' => 'devise/registrations#new', :as => :new_userman
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
end
