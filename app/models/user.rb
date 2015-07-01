class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:instagram]
  
  def self.from_omniauth(auth)
    where(username: auth.username).first_or_create do |user|
      user.bio             = auth.bio
      user.full_name       = auth.uid
      user.website         = auth.info.email
      user.profile_picture = auth.profile_picture
      user.access_token    = auth.access_token
    end
  end
end
