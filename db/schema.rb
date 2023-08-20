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

ActiveRecord::Schema[7.0].define(version: 2023_08_20_204951) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.bigint "sender_id", null: false
    t.bigint "patient_record_id", null: false
    t.string "title", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_record_id"], name: "index_messages_on_patient_record_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "organization_members", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_organization_members_on_organization_id"
    t.index ["user_id"], name: "index_organization_members_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patient_logs", force: :cascade do |t|
    t.string "loggable_type", null: false
    t.bigint "loggable_id", null: false
    t.bigint "patient_record_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loggable_type", "loggable_id"], name: "index_patient_logs_on_loggable"
    t.index ["patient_record_id"], name: "index_patient_logs_on_patient_record_id"
  end

  create_table "patient_records", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_patient_records_on_user_id"
  end

  create_table "referrals", force: :cascade do |t|
    t.bigint "sender_organization_id", null: false
    t.bigint "target_organization_id", null: false
    t.bigint "referrer_id", null: false
    t.bigint "patient_record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_record_id"], name: "index_referrals_on_patient_record_id"
    t.index ["referrer_id"], name: "index_referrals_on_referrer_id"
    t.index ["sender_organization_id"], name: "index_referrals_on_sender_organization_id"
    t.index ["target_organization_id"], name: "index_referrals_on_target_organization_id"
  end

  create_table "roles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "description", null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
  end

  add_foreign_key "messages", "patient_records"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "organization_members", "organizations"
  add_foreign_key "organization_members", "users"
  add_foreign_key "patient_logs", "patient_records"
  add_foreign_key "patient_records", "users"
  add_foreign_key "referrals", "organizations", column: "sender_organization_id"
  add_foreign_key "referrals", "organizations", column: "target_organization_id"
  add_foreign_key "referrals", "users", column: "referrer_id"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
