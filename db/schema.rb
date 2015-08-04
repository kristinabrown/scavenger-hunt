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

ActiveRecord::Schema.define(version: 20150804035648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  create_table "clues", force: :cascade do |t|
    t.string   "info"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "clues", ["location_id"], name: "index_clues_on_location_id", using: :btree

  create_table "hunts", force: :cascade do |t|
    t.string  "name"
    t.integer "number_of_teams"
    t.boolean "active",          default: true
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "active",     default: true
  end

  create_table "submissions", force: :cascade do |t|
    t.boolean  "correct",                 default: false
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "team_id"
    t.integer  "location_id"
    t.boolean  "responded_to",            default: false
  end

  add_index "submissions", ["location_id"], name: "index_submissions_on_location_id", using: :btree
  add_index "submissions", ["team_id"], name: "index_submissions_on_team_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string  "name"
    t.integer "hunt_id"
    t.string  "slug"
    t.string  "phone_number"
    t.integer "found_locations", default: 0
    t.integer "location_id"
    t.boolean "hunt_initiated",  default: false
  end

  add_index "teams", ["hunt_id"], name: "index_teams_on_hunt_id", using: :btree
  add_index "teams", ["location_id"], name: "index_teams_on_location_id", using: :btree

  add_foreign_key "clues", "locations"
  add_foreign_key "submissions", "locations"
  add_foreign_key "submissions", "teams"
  add_foreign_key "teams", "hunts"
  add_foreign_key "teams", "locations"
end
