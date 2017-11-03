class ImpressionsController < ApplicationController
  before_action :authorize
  before_action :authorize_add_impression, only: [:new]
  before_action :authorize_edit, except: [:new, :create]

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

private

  def impresssions_params
    params.require(:impression).permit(:clean, :crowded, :shade, :privacy, :fire)
  end

  def has_impression?
    if current_user.impressions.find_by(campground_id: params[:campground_id])
      return true
    else
      return false
    end
  end

  def authorize_add_impression
    redirect_to campground_path(params[:campground_id]), alert: "Not authorized - you have already submitted an impression for this campground!" if has_impression?
  end
end