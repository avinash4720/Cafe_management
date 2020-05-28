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

ActiveRecord::Schema.define(version: 2020_05_28_134943) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "img_url"
  end

  create_table "menuhelpers", force: :cascade do |t|
    t.bigint "menu_id"
    t.bigint "menuitem_id"
    t.bigint "category_id"
  end

  create_table "menuitems", force: :cascade do |t|
    t.bigint "menu_id"
    t.string "name"
    t.string "description"
    t.float "price"
    t.string "category"
    t.text "img_url"
    t.bigint "category_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "name"
    t.boolean "active_menu", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id"
    t.string "item_name"
    t.float "item_price"
    t.bigint "menu_id"
    t.integer "incart"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.boolean "delivered_status"
    t.float "cost"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "role"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
