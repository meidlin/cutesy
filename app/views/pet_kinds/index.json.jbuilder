json.array!(@pet_kinds) do |pet_kind|
  json.extract! pet_kind, :id, :name
  json.url pet_kind_url(pet_kind, format: :json)
end
