class CreateImpressions < ActiveRecord::Migration[5.1]
  def change
    create_table :impressions do |t|
      t.references :user, foreign_key: true
      t.references :campground, foreign_key: true
      t.integer :clean
      t.integer :crowded
      t.integer :shade
      t.integer :privacy
      t.integer :fire

      t.timestamps
    end
  end
end
