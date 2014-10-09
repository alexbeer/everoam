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

ActiveRecord::Schema.define(version: 20141009115543) do

  create_table "roam_images", force: true do |t|
    t.integer  "roam_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "caption"
  end

  create_table "roams", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "imagetwo_file_name"
    t.string   "imagetwo_content_type"
    t.integer  "imagetwo_file_size"
    t.datetime "imagetwo_updated_at"
    t.string   "imagethree_file_name"
    t.string   "imagethree_content_type"
    t.integer  "imagethree_file_size"
    t.datetime "imagethree_updated_at"
    t.string   "imagefour_file_name"
    t.string   "imagefour_content_type"
    t.integer  "imagefour_file_size"
    t.datetime "imagefour_updated_at"
    t.string   "imagefive_file_name"
    t.string   "imagefive_content_type"
    t.integer  "imagefive_file_size"
    t.datetime "imagefive_updated_at"
    t.string   "imagesix_file_name"
    t.string   "imagesix_content_type"
    t.integer  "imagesix_file_size"
    t.datetime "imagesix_updated_at"
    t.string   "imageseven_file_name"
    t.string   "imageseven_content_type"
    t.integer  "imageseven_file_size"
    t.datetime "imageseven_updated_at"
    t.string   "imageeight_file_name"
    t.string   "imageeight_content_type"
    t.integer  "imageeight_file_size"
    t.datetime "imageeight_updated_at"
    t.string   "imagenine_file_name"
    t.string   "imagenine_content_type"
    t.integer  "imagenine_file_size"
    t.datetime "imagenine_updated_at"
    t.string   "imageten_file_name"
    t.string   "imageten_content_type"
    t.integer  "imageten_file_size"
    t.datetime "imageten_updated_at"
    t.string   "description"
    t.string   "descriptiontwo"
    t.string   "descriptionthree"
    t.string   "descriptionfour"
    t.string   "descriptionfive"
    t.string   "descriptionsix"
    t.string   "descriptionseven"
    t.string   "descriptioneight"
    t.string   "descriptionnine"
    t.string   "descriptionten"
    t.string   "location"
  end

  add_index "roams", ["user_id"], name: "index_roams_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "username"
    t.string   "bio"
    t.string   "location"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
