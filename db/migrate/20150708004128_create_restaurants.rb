class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.[] :beer_ids
      t.text :location
      t.text :address
      t.text :formatted_address

      t.timestamps null: false
    end
  end
end
