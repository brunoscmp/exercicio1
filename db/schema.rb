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

ActiveRecord::Schema.define(version: 2020_11_04_130417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_plan_weeks", force: :cascade do |t|
    t.integer "week_number"
    t.date "start_date"
    t.date "end_date"
    t.string "business_activity"
    t.bigint "supervisor_action_plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supervisor_action_plan_id"], name: "index_action_plan_weeks_on_supervisor_action_plan_id"
    t.index ["week_number", "start_date", "end_date", "supervisor_action_plan_id"], name: "index_action_plan_weeks_on_number_start_end_supervisor_id", unique: true
  end

  create_table "supervisor_action_plans", force: :cascade do |t|
    t.string "branch", null: false
    t.date "mont", null: false
    t.integer "active_agents", default: 0
    t.decimal "goal", precision: 10, scale: 2, default: "0.0"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch", "mont", "user_id"], name: "index_supervisor_action_plans_on_branch_and_mont_and_user_id", unique: true
    t.index ["user_id"], name: "index_supervisor_action_plans_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "action_plan_weeks", "supervisor_action_plans"
  add_foreign_key "supervisor_action_plans", "users"
end
