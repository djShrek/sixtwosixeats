class PhotographsController < ApplicationController
  def index
    @photograph ||= Photograph.get_photos(params[:instagram_url])
    @pagination = @photograph["pagination"]["next_url"]
    @photographs = @photograph["data"]
  end
end
