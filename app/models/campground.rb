class Campground < ApplicationRecord
  belongs_to :user

  has_many :campground_images
  has_many :comments
  has_many :impressions
end
