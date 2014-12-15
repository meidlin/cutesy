# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
PetKind.destroy_all
Breed.destroy_all

dog = PetKind.create(name:"dog")
cat = PetKind.create(name:"cat")

dog_breeds =["Golden Retriever", "Labrador Retriever", "Beagle", "Poodle", "German Shepard", "Bulldog", "Pug", "Daschund", "Rottweiler", "Shi Tzu", "Maltese", "Pitbull", "Chihuahua", "Boxer", "Yorkie", "Other"]
dog_breeds.each{|b| Breed.create(pet_kind:dog, name:b)}

cat_breeds= ["Maine Coon", "Siamese", "Abyssinian", "Ragdoll", "Sphinx", "American Shorthair", "Burma", "Oriental", "Tabby", "Other"]
cat_breeds.each{|b| Breed.create(pet_kind:cat, name:b)}



Pet.create([{name: 'Darla', age:'4', sex:'female', description:'Darla is my name, being a sausage queen is my fame. I love to bark in your face'},{name: 'JoJo', age:'13', sex:'female', description:'JoJo is my name, and ill give you kisses for fame. But beweare I drink out of the toilet when I can'}])