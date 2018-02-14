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

ActiveRecord::Schema.define(version: 20180214112713) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "agency"
    t.string "account"
    t.bigint "bank_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_id"], name: "index_accounts_on_bank_id"
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "banks", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bets", force: :cascade do |t|
    t.boolean "completed"
    t.integer "accepted", default: 0
    t.boolean "canceled", default: false
    t.bigint "user_id"
    t.bigint "challenge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "value_cents", default: 0, null: false
    t.string "value_currency", default: "BRL", null: false
    t.index ["challenge_id"], name: "index_bets_on_challenge_id"
    t.index ["user_id"], name: "index_bets_on_user_id"
  end

  create_table "challenges", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.boolean "completed"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "value_cents", default: 0, null: false
    t.string "value_currency", default: "BRL", null: false
    t.index ["user_id"], name: "index_challenges_on_user_id"
  end

  create_table "charities", force: :cascade do |t|
    t.string "name"
    t.string "social_cause"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "recipient_id"
    t.integer "actor_id"
    t.datetime "read_at"
    t.string "action"
    t.text "message"
    t.integer "notifiable_id"
    t.string "notifiable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "relative_id"
    t.string "relative_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "value_cents", default: 0, null: false
    t.string "value_currency", default: "BRL", null: false
    t.integer "status"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "progresses", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "date"
    t.string "photo"
    t.bigint "challenge_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_progresses_on_challenge_id"
    t.index ["user_id"], name: "index_progresses_on_user_id"
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.string "cpf"
    t.date "birthday"
    t.string "photo"
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accounts", "banks"
  add_foreign_key "accounts", "users"
  add_foreign_key "bets", "challenges"
  add_foreign_key "bets", "users"
  add_foreign_key "challenges", "users"
  add_foreign_key "payments", "users"
  add_foreign_key "progresses", "challenges"
  add_foreign_key "progresses", "users"
end
