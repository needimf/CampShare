class CampgroundsController < ApplicationController
  before_action :authorize, except: [:index, :show]
  before_action :authorize_edit, only: [:edit, :update, :destroy]
  before_action :authorize_contributor, except: [:index, :show]

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
    @campground = Campground.find(params[:id])

    if @campground.update_attributes(campground_params)
      redirect_to campground_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    @campground = Campground.find(params[:id])
    @campground.destroy
    redirect_to campgrounds_path
  end

private

  def campground_params
    params.require(:campground).permit(:title, :content)
  end

  def authorize_contributor
    redirect_to root_path, alert: "You are not a contributor" if !current_user.contributor
  end

  def authorize_edit
    redirect_to campground_path(params[:id]), alert: "Not authorized - you did not author this campground!" if current_user != Campground.find(params[:id]).user
  end
end