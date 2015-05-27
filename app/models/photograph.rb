require 'open-uri'

class Photograph
  def self.get_photos
    # gem that does HTTP requests
    hash_tag = "626eats"
    instagram_url = "https://api.instagram.com/v1/tags/#{hash_tag}/media/recent?client_id=#{ENV["INSTAGRAM_CLIENT_ID"]}"
    data = URI.parse(instagram_url).read
    @data ||= JSON.parse(data)
  end

  def self.photograph_data
    self.get_photos["data"]
  end
end