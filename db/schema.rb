# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150717004306) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beerrestaurants", force: :cascade do |t|
    t.integer  "beer_id"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "beerrestaurants", ["beer_id", "restaurant_id"], name: "index_beerrestaurants_on_beer_id_and_restaurant_id", unique: true, using: :btree
  add_index "beerrestaurants", ["beer_id"], name: "index_beerrestaurants_on_beer_id", using: :btree
  add_index "beerrestaurants", ["restaurant_id"], name: "index_beerrestaurants_on_restaurant_id", using: :btree

  create_table "beers", force: :cascade do |t|
    t.string   "name"
    t.string   "brewery"
    t.string   "style"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "breweryDB_id"
    t.string   "labels"
    t.text     "description"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.float    "lat"
    t.float    "long"
    t.text     "location"
    t.text     "address"
    t.text     "formatted_address"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "place_id"
    t.float    "price"
    t.float    "rating"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "location"
    t.string   "image_url"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "beerrestaurants", "beers"
  add_foreign_key "beerrestaurants", "restaurants"
end
