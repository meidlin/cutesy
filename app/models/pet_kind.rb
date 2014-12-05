class PetKind < ActiveRecord::Base
	has_many :breeds
	accepts_nested_attributes_for :breeds
end
