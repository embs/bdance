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

ActiveRecord::Schema.define(version: 20140216212032) do

  create_table "addresses", force: true do |t|
    t.integer  "user_id"
    t.string   "street"
    t.integer  "number"
    t.string   "district"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignments", force: true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assignments", ["role_id"], name: "index_assignments_on_role_id"
  add_index "assignments", ["user_id"], name: "index_assignments_on_user_id"

  create_table "attendances", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attendances", ["user_id", "event_id"], name: "index_attendances_on_user_id_and_event_id"

  create_table "authentications", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.integer  "as_employee_id"
    t.string   "as_employee_type"
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

  create_table "groups", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "price"
    t.string   "local"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "modality_id"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "horaries", force: true do |t|
    t.string   "day"
    t.datetime "start"
    t.datetime "end"
    t.integer  "group_id"
    t.integer  "hours_package_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "horaries", ["group_id"], name: "index_horaries_on_group_id"
  add_index "horaries", ["hours_package_id"], name: "index_horaries_on_hours_package_id"

  create_table "hours_packages", force: true do |t|
    t.integer  "teacher_id"
    t.float    "price"
    t.date     "start"
    t.date     "end"
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

  create_table "phone_numbers", force: true do |t|
    t.string   "kind"
    t.integer  "ddd"
    t.integer  "number"
    t.string   "provider"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "presences", force: true do |t|
    t.integer  "user_id"
    t.datetime "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "private_classes", force: true do |t|
    t.integer  "pupil_id"
    t.integer  "hours_package_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "private_classes", ["pupil_id", "hours_package_id"], name: "index_private_classes_on_pupil_id_and_hours_package_id"

  create_table "pupils", force: true do |t|
    t.text     "observations"
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

  add_index "responsibilities", ["pupil_id", "responsible_id"], name: "index_responsibilities_on_pupil_id_and_responsible_id"

  create_table "responsibles", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rhythms", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "modality_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.integer  "as_user_id"
    t.string   "as_user_type"
    t.string   "rg"
    t.string   "profession"
    t.date     "birth"
    t.string   "cpf"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
