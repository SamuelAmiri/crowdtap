require 'rails_helper'

RSpec.describe "beers/show", type: :view do
  before(:each) do
    @beer = assign(:beer, Beer.create!(
      :name => "Name",
      :brewery => "Brewery",
      :style => "Style",
      :restaurant_ids => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Brewery/)
    expect(rendered).to match(/Style/)
    expect(rendered).to match(//)
  end
end
