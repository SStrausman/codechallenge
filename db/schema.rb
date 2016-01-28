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

ActiveRecord::Schema.define(version: 20160128001023) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assessments", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attendances", force: :cascade do |t|
    t.integer  "taster_id"
    t.integer  "event_id"
    t.boolean  "check_in",   default: false
    t.boolean  "check_out",  default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "beverages", force: :cascade do |t|
    t.integer  "brand_id"
    t.string   "beverage_type"
    t.float    "sale_price"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "brands", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "point_of_contact"
    t.string   "contact_email"
    t.string   "brand_name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "event_beverages", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "beverage_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "location"
    t.date     "event_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "brand_id"
    t.integer  "retailer_id"
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "assessment_id"
    t.string   "prompt"
    t.string   "answer"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "retailers", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "point_of_contact"
    t.string   "contact_email"
    t.string   "zip_code"
    t.string   "retailer_name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer  "beverage_id"
    t.integer  "event_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "taster_assessments", force: :cascade do |t|
    t.integer  "taster_id"
    t.integer  "assessment_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "tasters", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "real_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "usable_id"
    t.string   "usable_type"
  end

end
