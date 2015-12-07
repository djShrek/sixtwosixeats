class User < ActiveRecord::Base
  # include Hashie::Extensions::IndifferentAccess
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :rememberable, :trackable,
         :omniauthable, :omniauth_providers => [:instagram]

  def self.from_omniauth(auth)
    hash = {}
    auth.user.each do |k,v|
      hash[k] = v
    end

    where(uid: hash["id"]).first_or_create do |user|
      user.username        = hash["username"]
      user.bio             = hash["bio"]
      user.full_name       = hash["full_name"]
      user.website         = hash["website"]
      user.profile_picture = hash["profile_picture"]
      user.uid             = hash["id"]
      user.email           = hash["email"]
      user.access_token    = auth.access_token
    end
  end
end
