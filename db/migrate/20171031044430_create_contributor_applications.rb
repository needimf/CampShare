class CreateContributorApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :contributor_applications do |t|
      t.text :content
      t.boolean :pending
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
