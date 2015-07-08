class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.string :brewery
      t.string :style
      t.[] :restaurant_ids

      t.timestamps null: false
    end
  end
end
