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

ActiveRecord::Schema.define(version: 20160303110003) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "choices", force: :cascade do |t|
    t.string   "image"
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "look_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "choices", ["look_id"], name: "index_choices_on_look_id", using: :btree
  add_index "choices", ["user_id"], name: "index_choices_on_user_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "product_id"
  end

  add_index "likes", ["product_id"], name: "index_likes_on_product_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "looks", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "offers", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "supplier"
    t.decimal  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "offers", ["product_id"], name: "index_offers_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "size"
    t.string   "price"
    t.string   "color"
    t.string   "brand"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "ean"
    t.integer  "brand_id"
    t.string   "category"
  end

  add_index "products", ["brand_id"], name: "index_products_on_brand_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "choices", "looks"
  add_foreign_key "choices", "users"
  add_foreign_key "likes", "products"
  add_foreign_key "likes", "users"
  add_foreign_key "offers", "products"
  add_foreign_key "products", "brands"
end
