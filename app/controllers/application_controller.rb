class ApplicationController < ActionController::Base
  require 'open-uri'
  require 'net/http'

  protect_from_forgery with: :exception

  if Rails.env.production?
    CALLBACK_URL = "https://sixtwosixeats.herokuapp.com/"
  else
    CALLBACK_URL = "http://localhost:3000/oauth/instagram/callback"
  end

  def redirect_to_instagram_auth
    redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  end

end