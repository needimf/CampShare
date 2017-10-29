class CreateCampgrounds < ActiveRecord::Migration[5.1]
  def change
    create_table :campgrounds do |t|
      t.string :title
      t.text :content
      t.references :user, foreign_key: true
      t.integer :crowded_yes
      t.integer :crowded_no
      t.integer :clean_yes
      t.integer :clean_no
      t.integer :shade_yes
      t.integer :shade_no
      t.integer :privacy_yes
      t.integer :privacy_no
      t.integer :fire_yes
      t.integer :fire_no

      t.timestamps
    end
  end
end
