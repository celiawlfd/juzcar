class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.string :name
      t.string :address
      t.integer :price_per_night
      t.integer :number_of_people
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
