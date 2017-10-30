class ImpressionsController < ApplicationController
  before_action :authorize

  def index

  end

  def new
    @campground = Campground.find(params[:campground_id])
    @impression = Impression.new
  end

  def create
    @campground = Campground.find(params[:campground_id])
    @impression = Impression.new(impresssions_params)
    @impression.campground = @campground
    @impression.user = current_user
    if @impression.save
      redirect_to campground_path(@impression.campground)
    else
      render :new
    end
  end

  def edit
    @impression = Impression.find(params[:id])
  end

  def update
    @impression = Impression.find(params[:id])

    if @impression.update_attributes(impresssions_params)
      redirect_to campground_path(@impression.campground)
    else
      render :edit
    end
  end

  def destroy
    @impression = Impression.find(params[:id])
    @campground = @impression.campground
    @impression.destroy
    redirect_to campground_path(@campground)
  end

private

  def impresssions_params
    params.require(:impression).permit(:clean, :crowded, :shade, :privacy, :fire)
  end
end