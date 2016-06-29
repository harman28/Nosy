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

ActiveRecord::Schema.define(version: 20160629054716) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tokens", force: :cascade do |t|
    t.string   "value",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tokens", ["value"], name: "index_tokens_on_value", using: :btree

  create_table "updates", force: :cascade do |t|
    t.string   "team_id",    null: false
    t.string   "user_id",    null: false
    t.string   "user_name",  null: false
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "updates", ["team_id"], name: "index_updates_on_team_id", using: :btree
  add_index "updates", ["user_id"], name: "index_updates_on_user_id", using: :btree

end
