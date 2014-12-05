class CreateBreeds < ActiveRecord::Migration
  def change
    create_table :breeds do |t|
      t.string :name
      t.references :pet_kind, index: true
      t.string :trivia

      t.timestamps
    end
  end
end
