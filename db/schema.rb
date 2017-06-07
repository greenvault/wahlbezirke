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

ActiveRecord::Schema.define(version: 20170606191816) do

  create_table "districts", force: :cascade do |t|
    t.string   "district_identifier"
    t.integer  "state_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "name"
    t.index ["district_identifier"], name: "index_districts_on_district_identifier", unique: true
    t.index ["state_id"], name: "index_districts_on_state_id"
  end

  create_table "municipalities", force: :cascade do |t|
    t.string   "name"
    t.string   "municipality_identifier"
    t.integer  "district_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["district_id"], name: "index_municipalities_on_district_id"
    t.index ["municipality_identifier"], name: "index_municipalities_on_municipality_identifier", unique: true
    t.index ["name"], name: "index_municipalities_on_name"
  end

  create_table "precincts", force: :cascade do |t|
    t.string   "precinct_identifier"
    t.decimal  "district_score"
    t.integer  "district_rank"
    t.integer  "municipality_rank"
    t.integer  "municipality_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "district_id"
    t.index ["district_id"], name: "index_precincts_on_district_id"
    t.index ["municipality_id"], name: "index_precincts_on_municipality_id"
    t.index ["precinct_identifier"], name: "index_precincts_on_precinct_identifier"
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["name"], name: "index_states_on_name", unique: true
  end

end
