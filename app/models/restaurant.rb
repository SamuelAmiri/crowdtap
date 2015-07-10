class Restaurant < ActiveRecord::Base
	has_many :beerrestaurants
	has_many :beers, through: :beerrestaurants


  def self.save_data_from_api
    response = HTTParty.get('URI')
    restaurant_data = JSON.parse(response)
    restaurants = restaurants_data.map do |line|
      u = Restaurant.new
      u.external_id = line['user']['id']
      # set name value however you want to do that
      u.save
      u
    end
    users.select(&:persisted?)
  end

end
