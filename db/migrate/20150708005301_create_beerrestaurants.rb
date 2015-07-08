class CreateBeerrestaurants < ActiveRecord::Migration
  def change
    create_table :beerrestaurants do |t|
      t.belongs_to :beer, index: true, foreign_key: true
      t.belongs_to :restaurant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
