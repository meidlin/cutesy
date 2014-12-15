class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :twitter_handle
      t.string :description
      t.attachment :image
      t.timestamps
    end
  end
end
