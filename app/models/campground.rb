class Campground < ApplicationRecord
  belongs_to :user

  has_many :campground_images
end
