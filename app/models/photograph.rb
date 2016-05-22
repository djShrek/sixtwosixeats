require 'open-uri'

class Photograph
  def self.get_photos(instagram_url)
    # gem that does HTTP requests
    if instagram_url.nil?
      hash_tag = "626eats"
      instagram_url = "https://api.instagram.com/v1/tags/#{hash_tag}/media/recent?access_token=#{ENV["626_EATS_ACCESS_TOKEN"]}"
    else
      instagram_url = instagram_url
    end
    data = URI.parse(instagram_url)
              .read
    JSON.parse(data)
  end

  def self.photograph_data
    self.get_photos["data"]
  end

  def self.get_access_token
    redirect_uri = "http://localhost:3000/oauth/instagram/callback"
    url = "https://api.instagram.com/oauth/authorize/?client_id=#{ENV["INSTAGRAM_CLIENT_ID"]}&redirect_uri=#{redirect_uri}&response_type=token"
    data = URI.parse(url)
              .read
    JSON.parse(data)
  end

end