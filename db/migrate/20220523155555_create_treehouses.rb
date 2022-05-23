class CreateTreehouses < ActiveRecord::Migration[7.0]
  def change
    create_table :treehouses do |t|
      t.string :address
      t.integer :price_per_night
      t.text :description
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
