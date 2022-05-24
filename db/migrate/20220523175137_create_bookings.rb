class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :check_in
      t.date :check_out
      t.integer :number_of_guests
      t.references :user, null: false, foreign_key: true
      t.references :treehouse, null: false, foreign_key: true

      t.timestamps
    end
  end
end
