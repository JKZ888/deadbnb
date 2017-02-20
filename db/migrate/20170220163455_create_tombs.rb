class CreateTombs < ActiveRecord::Migration[5.0]
  def change
    create_table :tombs do |t|
      t.integer :owner_id
      t.integer :price
      t.text :description
      t.string :name_tomb
      t.string :picture_tomb
      t.references :graveyard, foreign_key: true
      t.timestamps
    end
    add_foreign_key :tombs, :users, column: :owner_id
  end
end
