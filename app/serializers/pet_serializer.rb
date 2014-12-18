class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :breed_id, :age, :sex, :description, :created_at, :updated_at, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at, :breedname, :ownername, :petavatar, :petgender

  def breedname
  	object.breed.name
  end

  def ownername
  	object.user.screen_name
  end

  def petavatar
  	object.avatar.url(:large)
  end

  def petgender
  	if object.sex == 1 then "M" else "F" end
  end	



end
