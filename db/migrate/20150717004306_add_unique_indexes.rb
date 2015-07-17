class AddUniqueIndexes < ActiveRecord::Migration
  def change
  	add_index :beerrestaurants, [:beer_id, :restaurant_id], unique: true
  end
end
