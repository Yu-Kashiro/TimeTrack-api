# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_06_16_071720) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "work_times_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["work_times_id"], name: "index_jobs_on_work_times_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "work_times", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "work_date", null: false
    t.time "clock_in"
    t.time "clock_out"
    t.integer "work_minute", default: 0, null: false
    t.integer "break_duration_minute", default: 0, null: false
    t.text "note"
    t.boolean "approved", default: false, null: false
    t.datetime "approved_at"
    t.integer "approved_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "overtime_work_minute"
    t.boolean "id_paid_holiday"
    t.index ["user_id", "work_date"], name: "index_work_times_on_user_id_and_work_date", unique: true
    t.index ["user_id"], name: "index_work_times_on_user_id"
  end

  add_foreign_key "work_times", "users"
  add_foreign_key "work_times", "users", column: "approved_by_id"
end
