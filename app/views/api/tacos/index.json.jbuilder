json.tacos @tacos do |taco|
  json.id taco.id
  json.name taco.name
  json.url api_taco_url(id: taco.id)
  json.thumbnail_url attachment_url(taco, :photo, :fill, 150, 150, format: "jpg")
  json.photo_url attachment_url(taco, :photo, format: "jpg")
  json.price number_to_currency(taco.price)
  json.price_in_cents (taco.price*100).to_i
  json.user do
    json.id taco.user.id
    json.username taco.user.username
  end
end
