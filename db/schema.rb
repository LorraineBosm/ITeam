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

ActiveRecord::Schema.define(version: 20180430093119) do

  create_table "agreement_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agreements", force: :cascade do |t|
    t.string "agreement_code", null: false
    t.string "imei", null: false
    t.text "contents", null: false
    t.text "problem", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone_number", null: false
    t.integer "device_model_id"
    t.integer "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "acceptor_id", null: false
    t.integer "technician_id"
    t.integer "status", default: 0, null: false
    t.integer "percentage", default: 0, null: false
    t.index ["device_model_id"], name: "index_agreements_on_device_model_id"
    t.index ["request_id"], name: "index_agreements_on_request_id"
  end

  create_table "agreements_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "agreement_id", null: false
    t.index ["agreement_id"], name: "index_agreements_users_on_agreement_id"
    t.index ["user_id", "agreement_id"], name: "index_agreements_users_on_user_id_and_agreement_id", unique: true
    t.index ["user_id"], name: "index_agreements_users_on_user_id"
  end

  create_table "device_brands", force: :cascade do |t|
    t.string "short_name", null: false
    t.string "full_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "device_type_id"
    t.index ["device_type_id"], name: "index_device_brands_on_device_type_id"
  end

  create_table "device_models", force: :cascade do |t|
    t.string "name", null: false
    t.string "code"
    t.integer "device_brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_brand_id"], name: "index_device_models_on_device_brand_id"
  end

  create_table "device_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.text "problem_desc", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone_number", null: false
    t.integer "device_model_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_model_id"], name: "index_requests_on_device_model_id"
  end

  create_table "roles", force: :cascade do |t|
    t.integer "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
    t.index ["role_id"], name: "index_roles_users_on_role_id"
    t.index ["user_id"], name: "index_roles_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
