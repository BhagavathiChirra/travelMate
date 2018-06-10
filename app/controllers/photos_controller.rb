class PhotosController < ApplicationController
  def new
  end

  def create
  end

  def show
  end

  def index
    @photos = Photo.all
  end

  def edit
  end

  def update
  end

  def destroy
    city_id = get_photo.city_id
    get_photo.destroy
    redirect_to city_path(city_id)
  end
  private
  def get_photo
    @photo = Photo.find params[:id]
  end
end
