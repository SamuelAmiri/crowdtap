class AddLabelToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :labels, :string
  end
end
