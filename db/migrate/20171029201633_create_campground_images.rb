class CreateCampgroundImages < ActiveRecord::Migration[5.1]
  def change
    create_table :campground_images do |t|
      t.attachment :image
      t.boolean :main_image
      t.text :caption
      t.references :campground, foreign_key: true

      t.timestamps
    end
  end
end
