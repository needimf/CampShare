class Campground < ApplicationRecord
  belongs_to :user

  has_many :campground_images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :impressions, dependent: :destroy

  def count_impressions_totals
    { clean_yes: self.impressions.where(clean: 1).count,
      clean_no: self.impressions.where(clean: -1).count,
      crowded_yes: self.impressions.where(crowded: 1).count,
      crowded_no: self.impressions.where(crowded: -1).count,
      shade_yes: self.impressions.where(shade: 1).count,
      shade_no: self.impressions.where(shade: -1).count,
      privacy_yes: self.impressions.where(privacy: 1).count,
      privacy_no: self.impressions.where(privacy: -1).count,
      fire_yes: self.impressions.where(fire: 1).count,
      fire_no: self.impressions.where(fire: -1).count
    }
  end
end
