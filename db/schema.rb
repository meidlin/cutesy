# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141207045733) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breeds", force: true do |t|
    t.string   "name"
    t.integer  "pet_kind_id"
    t.string   "trivia"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "breeds", ["pet_kind_id"], name: "index_breeds_on_pet_kind_id", using: :btree

  create_table "images", force: true do |t|
    t.string   "caption"
    t.float    "lat"
    t.float    "lng"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "pet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["pet_id"], name: "index_images_on_pet_id", using: :btree

  create_table "pet_kinds", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pets", force: true do |t|
    t.integer  "user_id"
    t.integer  "breed_id"
    t.integer  "age"
    t.string   "name"
    t.integer  "sex"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pets", ["breed_id"], name: "index_pets_on_breed_id", using: :btree
  add_index "pets", ["user_id"], name: "index_pets_on_user_id", using: :btree

  create_table "ratings", force: true do |t|
    t.integer  "user_id"
    t.integer  "pet_id"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["pet_id"], name: "index_ratings_on_pet_id", using: :btree
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "twitter_handle"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "screen_name"
    t.integer  "favourites_count"
    t.integer  "followers_count"
    t.integer  "friends_count"
    t.integer  "statuses_count"
    t.integer  "twitter_id"
    t.string   "lang"
    t.string   "name"
    t.string   "profile_image_url"
    t.string   "time_zone"
    t.integer  "utc_offset"
  end

end
