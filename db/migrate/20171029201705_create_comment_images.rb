class CreateCommentImages < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_images do |t|
      t.attachment :image
      t.text :caption
      t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
