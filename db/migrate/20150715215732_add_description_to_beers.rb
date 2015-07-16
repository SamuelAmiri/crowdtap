class AddDescriptionToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :description, :string
  end
end
