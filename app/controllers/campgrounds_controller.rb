class CampgroundsController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def index
    @campgrounds = Campground.all
  end

  def show
    @campground = Campground.find(params[:id])
  end

  def new
    @campground = Campground.new
  end

  def create
    @campground = Campground.new(campground_params)
    @campground.user = current_user
    if @campground.save
      redirect_to campgrounds_path
    else
      render :new
    end
  end

  def edit
    @campground = Campground.find(params[:id])
  end

  def update

  end

  def destroy

  end

private

  def campground_params
    params.require(:campground).permit(:title, :content)
  end
end