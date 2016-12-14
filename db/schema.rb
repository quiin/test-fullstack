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

ActiveRecord::Schema.define(version: 20161214080739) do

  create_table "personal_references", force: :cascade do |t|
    t.string   "first_name"
    t.string   "second_name"
    t.string   "first_last_name"
    t.string   "second_last_name"
    t.string   "cell_phone_number"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "profile_id"
  end

  add_index "personal_references", ["profile_id"], name: "index_personal_references_on_profile_id"

  create_table "profiles", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "username"
    t.string   "first_name"
    t.string   "second_name"
    t.string   "first_last_name"
    t.string   "second_last_name"
    t.date     "birth_date"
    t.string   "curp"
    t.string   "rfc"
    t.string   "gender"
    t.string   "birth_state"
    t.string   "phone_number"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "requisitions", force: :cascade do |t|
    t.float    "income"
    t.integer  "address_years"
    t.integer  "company_years"
    t.string   "marital_status"
    t.float    "requested_amount"
    t.string   "payment_terms"
    t.string   "bank"
    t.text     "comment"
    t.string   "company_name"
    t.string   "company_phone_number"
    t.string   "dependents_number"
    t.string   "company_position"
    t.boolean  "has_sgmm"
    t.boolean  "has_imss"
    t.boolean  "has_car"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "profile_id"
  end

  add_index "requisitions", ["profile_id"], name: "index_requisitions_on_profile_id"

end
