class CampgroundImage < ApplicationRecord
  belongs_to :campground

  has_attached_file :image, styles: { medium: "500x500>", thumb: "150x150>" }, presence: true, default_url: "https://i.imgur.com/iAGKmbc.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
