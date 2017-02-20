class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.integer :duration_years
      t.integer :nb_persons
      t.text :epitaph
      t.references :tomb, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
