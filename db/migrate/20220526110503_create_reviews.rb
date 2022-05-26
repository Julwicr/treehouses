class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :rating
      t.references :treehouse, null: false, foreign_key: true

      t.timestamps
    end
  end
end
