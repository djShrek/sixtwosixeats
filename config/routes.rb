Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    get '/oauth/instagram/callback' => 'users/omniauth_callbacks#instagram'
  end
  get '/oauth/connect',            to: 'application#redirect_to_instagram_auth'
  
  root 'photographs#index'
end
