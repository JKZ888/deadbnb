class CreateGraveyards < ActiveRecord::Migration[5.0]
  def change
    create_table :graveyards do |t|
      t.string :city
      t.integer :nb_places
      t.string :picture_graveyard

      t.timestamps
    end
  end
end
