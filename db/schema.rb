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

ActiveRecord::Schema.define(version: 20160923032055) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
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

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "banners", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
    t.integer  "sort"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "idol_infos", force: :cascade do |t|
    t.string  "fullname"
    t.string  "gender"
    t.string  "itsme_nickname"
    t.string  "itsme_id"
    t.string  "email"
    t.string  "identification"
    t.string  "address"
    t.string  "phone"
    t.date    "dob"
    t.string  "facebook"
    t.integer "fb_follwers_number"
    t.string  "zalo"
    t.string  "instagram"
    t.string  "others"
    t.string  "os"
    t.string  "cellphone_model"
    t.string  "time_of_start_streaming"
    t.string  "time_of_end_streaming"
    t.string  "content_of_streaming"
    t.string  "nextwork_for_streaming"
    t.string  "nextwork_speed"
    t.boolean "update_avatar"
    t.boolean "good_lightening"
    t.date    "getting_start"
    t.string  "payment_method"
    t.string  "account_holder"
    t.string  "bankname"
    t.string  "account_number"
    t.string  "routing_number"
    t.string  "bank_address"
    t.string  "swift_code"
  end

  create_table "idols", force: :cascade do |t|
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "name"
    t.string   "birthday"
    t.string   "nickname"
    t.string   "phone"
    t.string   "facebook"
    t.string   "instagram"
    t.string   "avatar"
    t.integer  "followers"
    t.string   "itsme_id"
    t.string   "bio"
    t.string   "slug"
    t.integer  "raking"
    t.string   "status"
    t.boolean  "approved",   default: true
    t.integer  "sort"
  end

  create_table "managers", force: :cascade do |t|
    t.string   "fullname"
    t.string   "phone"
    t.string   "email"
    t.string   "facebook"
    t.string   "position"
    t.string   "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
    t.integer  "idol_id"
  end

  create_table "policies", force: :cascade do |t|
    t.text    "content"
    t.boolean "status",  default: false
  end

  create_table "questions", force: :cascade do |t|
    t.text     "content"
    t.boolean  "status",     default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "ranks", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "idol_id"
    t.integer  "all_rank"
    t.integer  "month_rank"
    t.integer  "week_rank"
    t.boolean  "transform"
    t.boolean  "transform_month"
    t.boolean  "transform_week"
  end

  create_table "schedule_tasks", force: :cascade do |t|
    t.integer  "number_of_run"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

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
    t.string   "username"
    t.integer  "idol_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
