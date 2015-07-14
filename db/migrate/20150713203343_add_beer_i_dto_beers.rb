class AddBeerIDtoBeers < ActiveRecord::Migration
  def change
  	add_column :beers, :breweryDB_id, :string
  end
end
