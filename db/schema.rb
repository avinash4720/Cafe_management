# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_10_063858) do

  create_table "menuitems", force: :cascade do |t|
    t.bigint "menu_id"
    t.string "name"
    t.string "description"
    t.float "price"
    t.string "category"
  end

  create_table "menus", force: :cascade do |t|
    t.string "name"
    t.boolean "active_menu", null: false
  end

  create_table "orderitems", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "menu_item_id"
    t.string "menu_item_name"
    t.float "menu_item_price"
    t.bigint "qty"
  end

  create_table "orders", force: :cascade do |t|
    t.date "date"
    t.bigint "user_id"
    t.datetime "delivered_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "password_digest"
    t.string "name"
    t.string "role"
    t.string "email"
  end

end
