class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  CALLBACK_URL = "http://localhost:3000/oauth/instagram/callback"

  Instagram.configure do |config|
    config.client_id     = ENV["INSTAGRAM_CLIENT_ID"]
    config.client_secret = ENV["INSTAGRAM_CLIENT_SECRET"]
  end

  def instagram
    response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
    @user = User.from_omniauth(response)
    if @user.persisted?
      sign_in @user
      flash[:success] = "Signed in!"
    else
      session["devise.user_attributes"] = @user.attributes
      flash[:notice] = "Not signed in!"
    end
    redirect_to root_path
  end
end
