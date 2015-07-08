require 'rails_helper'

RSpec.describe "beers/edit", type: :view do
  before(:each) do
    @beer = assign(:beer, Beer.create!(
      :name => "MyString",
      :brewery => "MyString",
      :style => "MyString",
      :restaurant_ids => ""
    ))
  end

  it "renders the edit beer form" do
    render

    assert_select "form[action=?][method=?]", beer_path(@beer), "post" do

      assert_select "input#beer_name[name=?]", "beer[name]"

      assert_select "input#beer_brewery[name=?]", "beer[brewery]"

      assert_select "input#beer_style[name=?]", "beer[style]"

      assert_select "input#beer_restaurant_ids[name=?]", "beer[restaurant_ids]"
    end
  end
end
