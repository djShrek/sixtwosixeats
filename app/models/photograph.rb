require 'open-uri'

class Photograph
  def self.get_photos(instagram_url)
    # gem that does HTTP requests
    if instagram_url.nil?
      hash_tag = "626eats"
      instagram_url = "https://api.instagram.com/v1/tags/#{hash_tag}/media/recent?client_id=#{ENV["INSTAGRAM_CLIENT_ID"]}"
    else
      instagram_url = instagram_url
    end
    data = URI.parse(instagram_url).read
    JSON.parse(data)
  end

  def self.photograph_data
    self.get_photos["data"]
  end
end