class RemoveCountersFromCampgrounds < ActiveRecord::Migration[5.1]
  def change
    remove_column :campgrounds, :crowded_yes, :integer
    remove_column :campgrounds, :crowded_no, :integer
    remove_column :campgrounds, :clean_yes, :integer
    remove_column :campgrounds, :clean_no, :integer
    remove_column :campgrounds, :shade_yes, :integer
    remove_column :campgrounds, :shade_no, :integer
    remove_column :campgrounds, :privacy_yes, :integer
    remove_column :campgrounds, :privacy_no, :integer
    remove_column :campgrounds, :fire_yes, :integer
    remove_column :campgrounds, :fire_no, :integer
  end
end
