class AddReviewsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :content
      t.string :city
      t.string :country
      t.integer :rating
      t.string :user_name

      t.timestamps
    end
  end
end
