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
dog_breeds =["Affenpinscher","Afghan Hound","Airedale Terrier","Akbash","Akita","Alaskan Malamute","Alpaca","American Bulldog","American Eskimo Dog","American Hairless Terrier","American Staffordshire Terrier","American Water Spaniel","Anatolian Shepherd","Appenzell Mountain Dog","Australian Cattle Dog (Blue Heeler)","Australian Kelpie","Australian Shepherd","Australian Terrier","Basenji","Basset Hound","Beagle","Bearded Collie","Beauceron","Bedlington Terrier","Belgian Shepherd Dog Sheepdog","Belgian Shepherd Laekenois","Belgian Shepherd Malinois","Belgian Shepherd Tervuren","Bernese Mountain Dog","Bichon Frise","Black Labrador Retriever","Black Mouth Cur","Black Russian Terrier","Black And Tan Coonhound","Bloodhound","Blue Lacy","Bluetick Coonhound","Boerboel","Bolognese","Border Collie","Border Terrier","Borzoi","Boston Terrier","Bouvier Des Flanders","Boxer","Boykin Spaniel","Briard","Brittany Spaniel","Brussels Griffon","Bull Terrier","Bullmastiff","Cairn Terrier","Canaan Dog","Cane Corso Mastiff","Carolina Dog","Catahoula Leopard Dog","Cattle Dog","Caucasian Sheepdog (Caucasian Ovtcharka)","Cavalier King Charles Spaniel","Chesapeake Bay Retriever","Chihuahua","Chinese Crested Dog","Chinese Foo Dog","Chinook","Chocolate Labrador Retriever","Chow Chow","Cirneco Dell'Etna","Clumber Spaniel","Cockapoo","Cocker Spaniel","Collie","Coonhound","Corgi","Coton De Tulear","Curly-Coated Retriever","Dachshund","Dalmatian","Dandi Dinmont Terrier","Doberman Pinscher","Dogo Argentino","Dogue De Bordeaux","Dutch Shepherd","English Bulldog","English Cocker Spaniel","English Coonhound","English Pointer","English Setter","English Shepherd","English Springer Spaniel","English Toy Spaniel","Entlebucher","Eskimo Dog","Feist","Field Spaniel","Fila Brasileiro","Finnish Lapphund","Finnish Spitz","Flat-Coated Retriever","Fox Terrier","Foxhound","French Bulldog","Galgo Spanish Greyhound","German Pinscher","German Shepherd Dog","German Shorthaired Pointer","German Spitz","German Wirehaired Pointer","Giant Schnauzer","Glen Of Imaal Terrier","Golden Retriever","Gordon Setter","Great Dane","Great Pyrenees","Greater Swiss Mountain Dog","Greyhound","Harrier","Havanese","Hound","Hovawart","Husky","Ibizan Hound","Icelandic Sheepdog","Illyrian Sheepdog","Irish Setter","Irish Terrier","Irish Water Spaniel","Irish Wolfhound","Italian Greyhound","Italian Spinone","Jack Russell Terrier","Jack Russell Terrier (Parson Russell Terrier)Russell Terrier)","Japanese Chin","Jindo","Kai Dog","Karelian Bear Dog","Keeshond","Kerry Blue Terrier","Kishu","Klee Kai","Komondor","Kuvasz","Kyi Leo","Labrador Retriever","Lakeland Terrier","Lancashire Heeler","Leonberger","Lhasa Apso","Lowchen","Maltese","Manchester Terrier","Maremma Sheepdog","Mastiff","McNab","Miniature Pinscher","Mountain Cur","Mountain Dog","Munsterlander","Neapolitan Mastiff","New Guinea Singing Dog","Newfoundland Dog","Norfolk Terrier","Norwegian Buhund","Norwegian Elkhound","Norwegian Lundehund","Norwich Terrier","Nova Scotia Duck-Tolling Retriever","Old English Sheepdog","Otterhound","Papillon","Patterdale Terrier (Fell Terrier)","Pekingese","Peruvian Inca Orchid","Petit Basset Griffon Vendeen","Pharaoh Hound","Pit Bull Terrier","Plott Hound","Podengo Portugueso","Pointer","Polish Lowland Sheepdog","Pomeranian","Poodle","Portuguese Water Dog","Presa Canario","Pug","Puli","Pumi","Rat Terrier","Redbone Coonhound","Retriever","Rhodesian Ridgeback","Rottweiler","Saint Bernard St. Bernard","Saluki","Samoyed","Sarplaninac","Schipperke","Schnauzer","Scottish Deerhound","Scottish Terrier Scottie","Sealyham Terrier","Setter","Shar Pei","Sheep Dog","Shepherd","Shetland Sheepdog Sheltie","Shiba Inu","Shih Tzu","Siberian Husky","Silky Terrier","Skye Terrier","Sloughi","Smooth Fox Terrier","South Russian Ovtcharka","Spaniel","Spitz","Staffordshire Bull Terrier","Standard Poodle","Sussex Spaniel","Swedish Vallhund","Terrier","Thai Ridgeback","Tibetan Mastiff","Tibetan Spaniel","Tibetan Terrier","Tosa Inu","Toy Fox Terrier","Treeing Walker Coonhound","Vizsla","Weimaraner","Welsh Corgi","Welsh Springer Spaniel","Welsh Terrier","West Highland White Terrier Westie","Wheaten Terrier","Whippet","White German Shepherd","Wire Fox Terrier","Wire-Haired Pointing Griffon","Wirehaired Terrier","Xoloitzcuintle (Mexican Hairless)","Yellow Labrador Retriever","Yorkshire Terrier Yorkie"]
dog_breeds.each{|b| Breed.create(pet_kind:dog, name:b)}

Pet.create([{name: 'Darla', age:'4', sex:'female', description:'Darla is my name, being a sausage queen is my fame. I love to bark in your face'},{name: 'JoJo', age:'13', sex:'female', description:'JoJo is my name, and ill give you kisses for fame. But beweare I drink out of the toilet when I can'}])