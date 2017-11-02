class User < ApplicationRecord
  has_many :campgrounds, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :impressions, dependent: :destroy
  has_many :contributor_applications, dependent: :destroy

  has_attached_file :image, styles: { medium: "500x500>", thumb: "100x100>" }, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  #security and validations
  has_secure_password
  validates :email, presence: true, uniqueness: true, on: :create
  validates :password, length: { minimum: 6 }, on: :create

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
