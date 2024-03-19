Rails.application.routes.draw do
  # get 'pages/home'
  # devise_for :users

  root 'pages#home'
  devise_for :users, controllers: {
  registrations: 'users/registrations', # This controller handles actions related to user sign-up and account management.
  session: 'users/sessions', # This controller handles actions related to user sign-in and sign-out.
  omniauth_callbacks: 'users/omniauth_callbacks' # This controller manages the authentication flow when users sign in using external providers like Google, Facebook, etc.
  }

  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }
end
