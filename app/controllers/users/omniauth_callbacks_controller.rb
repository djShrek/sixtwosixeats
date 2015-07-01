class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def instagram
    Instagram.get_access_token(params[:code], :redirect_uri =>  "http://localhost:3000/oauth/callback")
    redirect_to "https://api.instagram.com/oauth/access_token"
  end
end