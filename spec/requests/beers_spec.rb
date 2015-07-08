require 'rails_helper'

RSpec.describe "Beers", type: :request do
  describe "GET /beers" do
    it "works! (now write some real specs)" do
      get beers_path
      expect(response).to have_http_status(200)
    end
  end
end
