json.array!(@beers) do |beer|
  json.extract! beer, :id, :name, :brewery, :style, :restaurant_ids
  json.url beer_url(beer, format: :json)
end
