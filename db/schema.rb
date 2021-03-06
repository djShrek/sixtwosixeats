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

ActiveRecord::Schema.define(version: 20151109074952) do

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: ""
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.text     "bio"
    t.string   "full_name"
    t.text     "profile_picture"
    t.string   "username"
    t.text     "website"
    t.text     "access_token"
    t.string   "uid"
  end

  add_index "users", ["access_token"], name: "index_users_on_access_token"
  add_index "users", ["bio"], name: "index_users_on_bio"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["full_name"], name: "index_users_on_full_name"
  add_index "users", ["profile_picture"], name: "index_users_on_profile_picture"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid"], name: "index_users_on_uid"
  add_index "users", ["username"], name: "index_users_on_username"
  add_index "users", ["website"], name: "index_users_on_website"

end
