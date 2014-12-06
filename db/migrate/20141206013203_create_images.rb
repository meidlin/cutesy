class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :caption
      t.float :lat
      t.float :lng
      t.attachment :image
      t.references :pet, index: true

      t.timestamps
    end
  end
end
