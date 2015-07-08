require 'rails_helper'

RSpec.describe "restaurants/new", type: :view do
  before(:each) do
    assign(:restaurant, Restaurant.new(
      :name => "MyString",
      :lat => 1.5,
      :long => 1.5,
      :beer_ids => ""
    ))
  end

  it "renders new restaurant form" do
    render

    assert_select "form[action=?][method=?]", restaurants_path, "post" do

      assert_select "input#restaurant_name[name=?]", "restaurant[name]"

      assert_select "input#restaurant_lat[name=?]", "restaurant[lat]"

      assert_select "input#restaurant_long[name=?]", "restaurant[long]"

      assert_select "input#restaurant_beer_ids[name=?]", "restaurant[beer_ids]"
    end
  end
end
