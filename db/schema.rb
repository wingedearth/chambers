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

ActiveRecord::Schema.define(version: 20160210045058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_types", force: :cascade do |t|
    t.boolean  "curates",    default: false
    t.integer  "user_id"
    t.integer  "chamber_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "access_types", ["chamber_id"], name: "index_access_types_on_chamber_id", using: :btree
  add_index "access_types", ["user_id"], name: "index_access_types_on_user_id", using: :btree

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "genre"
    t.string   "description"
    t.string   "book_uri"
    t.string   "image_uri", default: "http://www.thedailyrash.com/wp-content/uploads/2012/08/old_book.jpg"
    t.integer  "chamber_id"
    t.boolean  "featured",    default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "books_users", force: :cascade do |t|
    t.integer "book_id"
    t.integer "user_id"
  end

  add_index "books_users", ["book_id"], name: "index_books_users_on_book_id", using: :btree
  add_index "books_users", ["user_id"], name: "index_books_users_on_user_id", using: :btree

  create_table "chambers", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "image_uri",   default: "http://www.onlinecollege.org/wp-content/uploads/George%20Peabody%20Library.jpg"
    t.string   "featured",    default: "f"
    t.datetime "created_at",                                                                                             null: false
    t.datetime "updated_at",                                                                                             null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.boolean  "featured",   default: false
    t.text     "text"
    t.integer  "book_id"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "reviews", ["book_id"], name: "index_reviews_on_book_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "handle"
    t.string   "city"
    t.string   "state"
    t.string   "description"
    t.string   "image_uri",          default: "default-profile-img.jpg"
    t.integer  "current_chamber_id"
    t.integer  "current_book_id"
    t.boolean  "featured",           default: false
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

  add_foreign_key "access_types", "chambers"
  add_foreign_key "access_types", "users"
  add_foreign_key "books_users", "books"
  add_foreign_key "books_users", "users"
  add_foreign_key "reviews", "books"
  add_foreign_key "reviews", "users"
end
