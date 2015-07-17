class AddDescriptionToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :description, :text
  end
end
