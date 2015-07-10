class AddPlaceIdToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :place_id, :string
  end
end
