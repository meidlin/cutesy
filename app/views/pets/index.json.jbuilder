json.array!(@pets) do |pet|
  json.extract! pet, :id, :age, :name, :sex, :description
  json.url pet_url(pet, format: :json)
end
