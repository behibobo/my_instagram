# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_01_130252) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "direct_messages", force: :cascade do |t|
    t.bigint "from_id"
    t.bigint "to_id"
    t.text "body"
    t.boolean "seen", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["from_id"], name: "index_direct_messages_on_from_id"
    t.index ["to_id"], name: "index_direct_messages_on_to_id"
  end

  create_table "friends", force: :cascade do |t|
    t.bigint "follower_id"
    t.bigint "followee_id"
    t.boolean "accepted", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followee_id"], name: "index_friends_on_followee_id"
    t.index ["follower_id"], name: "index_friends_on_follower_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "image"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "avatar"
  end

  add_foreign_key "direct_messages", "users", column: "from_id"
  add_foreign_key "direct_messages", "users", column: "to_id"
  add_foreign_key "friends", "users", column: "followee_id"
  add_foreign_key "friends", "users", column: "follower_id"
  add_foreign_key "posts", "users"
end
