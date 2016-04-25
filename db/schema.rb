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

ActiveRecord::Schema.define(version: 20160415185232) do

  create_table "albums", force: :cascade do |t|
    t.integer "duration"
    t.string  "artist"
    t.string  "producer"
    t.string  "studio"
    t.string  "features"
  end

  create_table "games", force: :cascade do |t|
    t.string "platform"
    t.string "studio"
  end

  create_table "movies", force: :cascade do |t|
    t.text    "cast"
    t.string  "director"
    t.string  "studio"
    t.integer "duration"
    t.integer "product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.date     "release_date"
    t.string   "rating"
    t.integer  "score"
    t.integer  "importance"
    t.integer  "actable_id"
    t.string   "actable_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "text"
    t.integer  "score"
    t.integer  "likes"
    t.integer  "dislikes"
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shows", force: :cascade do |t|
    t.text    "cast"
    t.integer "seasons"
    t.integer "duration"
    t.integer "episodes"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.date     "birth_date"
    t.string   "gender"
    t.string   "country"
    t.string   "role"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end