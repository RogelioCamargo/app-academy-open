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

ActiveRecord::Schema[7.0].define(version: 2022_06_24_042857) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cat_rental_requests", force: :cascade do |t|
    t.integer "cat_id", null: false
    t.date "end_date", null: false
    t.date "start_date", null: false
    t.string "status", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["cat_id"], name: "index_cat_rental_requests_on_cat_id"
  end

  create_table "cats", force: :cascade do |t|
    t.date "birth_date", null: false
    t.string "color", null: false
    t.string "name", null: false
    t.string "sex", null: false
    t.text "description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_cats_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name", null: false
    t.string "password_digest", null: false
    t.string "session_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["password_digest"], name: "index_users_on_password_digest", unique: true
    t.index ["user_name"], name: "index_users_on_user_name", unique: true
  end

end
