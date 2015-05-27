class PhotographsController < ApplicationController
  def index
    @photograph ||= Photograph.get_photos
    @photographs = @photograph["data"]
  end
end
