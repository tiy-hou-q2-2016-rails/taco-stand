json.taco do
  json.id @taco.id
  json.name @taco.name
  json.url api_taco_url(id: @taco.id)
  json.photo_url @taco.photo_url
  json.price number_to_currency(@taco.price)
  json.price_in_cents (@taco.price*100).to_i
  json.user do
    json.id @taco.user.id
    json.username @taco.user.username
  end
end
