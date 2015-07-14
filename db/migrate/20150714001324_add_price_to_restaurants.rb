class AddPriceToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :price, :float
  end
end
