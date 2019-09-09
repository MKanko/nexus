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

ActiveRecord::Schema.define(version: 2019_09_05_035735) do

  create_table "companies", force: :cascade do |t|
    t.string "company_name"
    t.integer "user_id"
    t.string "company_address"
    t.string "company_contact"
    t.string "contact_position"
    t.string "contact_work_phone"
    t.string "contact_cell_phone"
    t.string "contact_email"
    t.text "company_notes"
    t.text "contact_notes"
    t.datetime "last_meeting"
    t.text "last_meeting_notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.integer "company_id"
    t.binary "photo"
    t.string "contact_type"
    t.string "relationship"
    t.string "home_phone"
    t.string "cell_phone"
    t.string "work_phone"
    t.string "personal_email"
    t.string "work_email"
    t.string "home_address"
    t.string "work_address"
    t.text "contact_notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_contacts_on_company_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "year"
    t.datetime "month"
    t.datetime "day_date"
    t.string "day_name"
    t.datetime "hour"
    t.datetime "half_hour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "schedule_item"
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.integer "schedule_id"
    t.integer "company_id"
    t.string "type"
    t.string "status"
    t.datetime "deadline"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_tasks_on_company_id"
    t.index ["schedule_id"], name: "index_tasks_on_schedule_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "uid"
  end

end
