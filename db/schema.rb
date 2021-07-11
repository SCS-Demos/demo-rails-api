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

ActiveRecord::Schema.define(version: 2021_07_10_095112) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_enum :user_type, [
    "admin",
    "operator",
  ], force: :cascade

  create_table "categories", force: :cascade do |t|
    t.text "name"
    t.bigint "products_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.bigint "category_id"
    t.string "name"
    t.decimal "price", precision: 8, scale: 2, default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "password_digest"
    t.enum "user_type", enum_name: "user_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["user_type"], name: "index_users_on_user_type"
  end

  add_foreign_key "products", "categories"
end
