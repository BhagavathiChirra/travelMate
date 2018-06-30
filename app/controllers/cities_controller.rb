class CitiesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :check_if_admin, only: [:edit, :destroy, :new]
  # before_action :check_if_logged_in, only: [:index, :show]


  def new
    @city = City.new
  end

  def create
    city = City.new city_params
    city.save
    redirect_to city_path(city)
  end

  def show
    @city = City.find(params[:id])
    @posts = Post.where city_id: params[:id]
  end

  def index
    @cities = City.all
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    city = City.find(params[:id])
    city.update_attributes(city_params)
    city.save
    redirect_to(city_path(city))

  end

  def destroy
    @city = City.find(params[:id])
    @city.destroy
    redirect_to cities_path
  end

  private

  def city_params
    params.require(:city).permit(:name, :image, :bio)
  end
end
