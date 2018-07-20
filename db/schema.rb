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

ActiveRecord::Schema.define(version: 2018_06_13_220500) do

  create_table "expenses", force: :cascade do |t|
    t.integer "user_id"
    t.string "kind"
    t.float "cost"
    t.string "reason"
    t.integer "day"
    t.integer "month"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goods", force: :cascade do |t|
    t.string "description"
    t.integer "quantity"
    t.integer "user_id"
    t.float "buy_price"
    t.string "buyed_from"
    t.integer "buy_day"
    t.integer "buy_month"
    t.integer "buy_year"
    t.string "kind"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_goods_on_user_id_and_created_at"
  end

  create_table "sales", force: :cascade do |t|
    t.integer "user_id"
    t.integer "good_id"
    t.integer "quantity"
    t.float "sell_price"
    t.string "sold_to"
    t.integer "sell_day"
    t.integer "sell_month"
    t.integer "sell_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
