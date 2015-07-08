json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :lat, :long, :beer_ids
  json.url restaurant_url(restaurant, format: :json)
end
