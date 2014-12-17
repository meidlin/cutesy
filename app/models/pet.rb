class Pet < ActiveRecord::Base
  belongs_to :user
  # belongs_to :breed

  has_attached_file :avatar, 
  					
   					:styles => {
  			      :original => '1920x1680>',
			        :small    => '100x100#',
			        :medium   => '250x250',
			        :large    => '500x500>'
			        },
			        :use_timestamp => false

  
   validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  

end




