class Breed < ActiveRecord::Base
  belongs_to :pet_kind
  has_many :pets
end
