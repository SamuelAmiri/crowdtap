class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.[] :beer_ids

      t.timestamps null: false
    end
  end
end
