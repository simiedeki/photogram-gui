class PhotosController < ApplicationController
  def index
    matching_photos=Photo.all
    
    @list_of_photos=matching_photos.order({:created_at => :desc})

    render "photos/index"
  end
  def show
    url_id=params.fetch("path_id")
    matching_photos=Photo.where({:id => url_id })
    @the_photo =matching_photos.at(0)
    render "photos/show"


  end
  def delete
    the_id = params.fetch("path_id")
    photo = Photo.find_by({ :id => the_id })
  
    photo.destroy
  
    redirect_to "/photos"

  end
  def create
   
      # params hash looks like this:
      # {"the_title"=>"1", "the_year"=>"2", "the_duration"=>"3", "the_description"=>"4", "the_image"=>"5", "the_director_id"=>"6"}
  
     m = Photo.new
    m.caption = params.fetch("input_caption")
    m.image = params.fetch("input_image")
    m.owner_id = params.fetch("input_owner_id")
  
   
    m.save


    redirect_to "/photos/#{m.id}"
  
      # Retrieve the user's inputs from params
      # Create a record in the movie table
      # Populate each column with the user input
      # Save
  
      # Redirect the user back to the /movies URL
    
  end
  def update
    the_id = params.fetch("path_id")
    @the_photo = Photo.where({ :id => the_id }).at(0)
    @the_photo.image = params.fetch("input_image")
    @the_photo.caption = params.fetch("input_caption")
    if @the_photo.valid?
      @the_photo.save
      redirect_to("/photos/#{@the_photo.id}", { :notice => "Actor updated successfully."} )
    else
      redirect_to("/photos/#{@the_photo.id}", { :alert => "Actor failed to update successfully."})
    end
  
  end
end
