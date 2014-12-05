class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.references :user, index: true
      t.references :breed, index: true
      t.integer :age
      t.string :name
      t.integer :sex
      t.string :description

      t.timestamps
    end
  end
end
