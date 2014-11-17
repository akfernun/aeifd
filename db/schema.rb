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

ActiveRecord::Schema.define(version: 20141117192255) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "asset_roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assets", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "battalion_id"
  end

  create_table "battalions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "incident_id"
  end

  create_table "incident_assignments", force: true do |t|
    t.integer  "incident_id"
    t.integer  "location_id"
    t.integer  "asset_role_id"
    t.integer  "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "floor"
  end

  create_table "incident_strategies", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "incidents", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "scene_type_id"
    t.integer  "battalion_id"
    t.integer  "incident_strategy_id"
    t.datetime "end_time"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mayday_assignments", force: true do |t|
    t.integer  "mayday_id"
    t.integer  "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maydays", force: true do |t|
    t.integer  "incident_assignment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "code"
  end

  create_table "scene_assignments", force: true do |t|
    t.integer  "scene_id"
    t.integer  "asset_id"
    t.datetime "arrival_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
    t.integer  "asset_role_id"
    t.string   "floor"
  end

  create_table "scene_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "floor"
    t.boolean  "hasBasement"
  end

  create_table "scenes", force: true do |t|
    t.integer  "incident_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "scene_type_id"
    t.integer  "battalion_id"
    t.integer  "incident_strategy_id"
  end

  create_table "tasks", force: true do |t|
    t.boolean  "primar_search"
    t.boolean  "all_clear"
    t.boolean  "utilities_contacted"
    t.boolean  "safety_officer_arrived"
    t.boolean  "utilities_disconnected"
    t.boolean  "secondary_search"
    t.boolean  "fire_under_control"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "incident_id"
  end

  create_table "timers", force: true do |t|
    t.datetime "primary_search"
    t.datetime "all_clear"
    t.datetime "utilities_contacted"
    t.datetime "safety_officer_arrived"
    t.datetime "utilities_disconnected"
    t.datetime "secondary_search"
    t.datetime "fire_under_control"
    t.integer  "incident_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
