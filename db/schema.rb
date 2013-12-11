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

ActiveRecord::Schema.define(version: 20131211070014) do

  create_table "addresses", force: true do |t|
    t.integer  "user_id"
    t.string   "street"
    t.string   "zip_code"
    t.string   "district"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.string   "responsibility"
    t.float    "wage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enrollments", force: true do |t|
    t.string   "number"
    t.datetime "date"
    t.integer  "pupil_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "local"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events_users", id: false, force: true do |t|
    t.integer "event_id"
    t.integer "user_id"
  end

  add_index "events_users", ["event_id", "user_id"], name: "index_events_users_on_event_id_and_user_id"

  create_table "groups", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "price"
    t.time     "hour"
    t.string   "local"
    t.date     "start"
    t.date     "end"
    t.integer  "modality_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hours_packages", force: true do |t|
    t.integer  "amount"
    t.text     "weekly_hours"
    t.integer  "pupil_id"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "managers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "modalities", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "monthly_fees", force: true do |t|
    t.float    "amount"
    t.date     "due_date"
    t.integer  "pupil_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.datetime "date"
    t.integer  "monthly_fee_id"
    t.integer  "pupil_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "presences", force: true do |t|
    t.integer  "user_id"
    t.datetime "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pupils", force: true do |t|
    t.integer  "responsible_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responsibilities", force: true do |t|
    t.string   "kinship"
    t.integer  "pupil_id"
    t.integer  "responsible_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responsibles", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rhythms", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "modality_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "rg"
    t.string   "profession"
    t.datetime "birth"
    t.string   "cpf"
    t.text     "phone"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mail"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
