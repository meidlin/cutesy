class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :screen_name, :string
	add_column :users, :favourites_count, :integer
	add_column :users, :followers_count, :integer
	add_column :users, :friends_count, :integer
	add_column :users, :statuses_count, :integer
	add_column :users, :twitter_id, :integer
	add_column :users, :lang, :string
	add_column :users, :name, :string
	add_column :users, :profile_image_url, :string
	add_column :users, :time_zone, :string
	add_column :users, :utc_offset, :integer
  end
end


# t.string   "email"
#     t.string   "password_digest"
#     t.string   "twitter_handle"
#     t.string   "image_file_name"
#     t.string   "image_content_type"
#     t.integer  "image_file_size"
#     t.datetime "image_updated_at"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end