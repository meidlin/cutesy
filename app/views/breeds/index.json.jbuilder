json.array!(@breeds) do |breed|
  json.extract! breed, :id, :name, :pet_kind_id
  json.url breed_url(breed, format: :json)
end
