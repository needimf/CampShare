class User < ApplicationRecord
  #relations
  has_many :campgrounds, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :impressions, dependent: :destroy

  #security and validations
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
