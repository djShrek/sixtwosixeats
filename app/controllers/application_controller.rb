class ApplicationController < ActionController::Base
  require 'open-uri'
  require 'net/http'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  CALLBACK_URL = "http://localhost:3000/oauth/instagram/callback"

  Instagram.configure do |config|
    config.client_id = ENV["INSTAGRAM_CLIENT_ID"]
    config.client_secret = ENV["INSTAGRAM_CLIENT_SECRET"]
  end

  def redirect_to_instagram_auth
    redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  end

  def instagram
    10.times do 
      puts params[:code]
    end
    response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
    10.times do
      puts response
    end
  end


end
