class ImpressionsController < ApplicationController
  before_action :authorize

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

private

  def impresssions_params
    params.require(:impression).permit(:clean, :crowded, :shade, :privacy, :fire)
  end
end