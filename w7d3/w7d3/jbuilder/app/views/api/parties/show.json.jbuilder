json.partial! 'api/parties/party', party: @party
json.guests @party.guests do |guest|
  json.name guest.name
  # json.guest guest.age
  # json.guest guest.favorite_color
  json.gifts guest.gifts do |gift|
    json.title gift.title
    # json.gift gift.description
  end
end
# json.gifts @party.guests.gifts
# json.array! @party.guests do |guest|
#   json.gifts guest.gifts
# end
