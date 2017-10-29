class User < ApplicationRecord
  #relations
  has_many :campgrounds
  has_many :comments
  has_many :impressions

  #security and validations
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }
end
