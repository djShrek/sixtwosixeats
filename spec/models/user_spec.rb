require 'rails_helper'

describe User do
  let(:omniauth_hash) do
    attrs = {
      user: { username: "shinobob",
      bio: "a dude",
      full_name: "bob",
      website: "www.test.com",
      profile_picture: "www.google.com",
      id: "123456",
      email: "test@gmail.com",
      },
      access_token: "2054410173.64d94ca.cb1d7d3f4fa64c8eb9ce1b7aebcc80e5"
    }
    Hashie::Mash.new(attrs)
  end

  describe "#from_omniauth" do
    context "User does not exist" do
      it "creates a new user" do
        user = User.from_omniauth(omniauth_hash)
        expect(user.username).to eq "shinobob"
        expect(user.bio).to eq "a dude"
        expect(user.full_name).to eq "bob"
        expect(user.website).to eq "www.test.com"
        expect(user.profile_picture).to eq "www.google.com"
        expect(user.uid).to eq "123456"
        expect(user.email).to eq "test@gmail.com"
        expect(user.access_token).to eq "2054410173.64d94ca.cb1d7d3f4fa64c8eb9ce1b7aebcc80e5"
      end

      it "increases the User count by 1" do
        expect{User.from_omniauth(omniauth_hash)}.to change {User.count}.from(0).to(1)
      end
    end

    context "User does exist" do
      it "does not increase the user count" do
        User.from_omniauth(omniauth_hash)
        expect{User.from_omniauth(omniauth_hash)}.to change{User.count}.by(0)
      end
    end
  end
end
