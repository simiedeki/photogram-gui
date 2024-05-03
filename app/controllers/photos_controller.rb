class PhotosController < ApplicationController
  def index
    matching_photos=Photo.all
    
    @list_of_photos=matching_photos.order({:created_at => :desc})

    render "photos/index"
  end
  def show
    render "photos/show"
  end

end
