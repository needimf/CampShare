class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :campground

  has_many :comment_images, dependent: :destroy
end
