class Campground < ApplicationRecord
  belongs_to :user

  has_many :campground_images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :impressions, dependent: :destroy
end
