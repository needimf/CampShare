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

ActiveRecord::Schema.define(version: 20171031044430) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campground_images", force: :cascade do |t|
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.boolean "main_image"
    t.text "caption"
    t.bigint "campground_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campground_id"], name: "index_campground_images_on_campground_id"
  end

  create_table "campgrounds", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_campgrounds_on_user_id"
  end

  create_table "comment_images", force: :cascade do |t|
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.text "caption"
    t.bigint "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_comment_images_on_comment_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "campground_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campground_id"], name: "index_comments_on_campground_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "contributor_applications", force: :cascade do |t|
    t.text "content"
    t.boolean "pending"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_contributor_applications_on_user_id"
  end

  create_table "impressions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "campground_id"
    t.integer "clean"
    t.integer "crowded"
    t.integer "shade"
    t.integer "privacy"
    t.integer "fire"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campground_id"], name: "index_impressions_on_campground_id"
    t.index ["user_id"], name: "index_impressions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.boolean "admin"
    t.boolean "contributor"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "campground_images", "campgrounds"
  add_foreign_key "campgrounds", "users"
  add_foreign_key "comment_images", "comments"
  add_foreign_key "comments", "campgrounds"
  add_foreign_key "comments", "users"
  add_foreign_key "contributor_applications", "users"
  add_foreign_key "impressions", "campgrounds"
  add_foreign_key "impressions", "users"
end
