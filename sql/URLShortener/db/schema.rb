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

ActiveRecord::Schema[7.0].define(version: 2022_03_19_001204) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "shorten_urls", force: :cascade do |t|
    t.string "short_url", null: false
    t.string "long_url", null: false
    t.integer "submitter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["short_url"], name: "index_shorten_urls_on_short_url", unique: true
    t.index ["submitter_id"], name: "index_shorten_urls_on_submitter_id"
  end

  create_table "tag_topics", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "tag_topic_id", null: false
    t.integer "shorten_url_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shorten_url_id"], name: "index_taggings_on_shorten_url_id"
    t.index ["tag_topic_id", "shorten_url_id"], name: "index_taggings_on_tag_topic_id_and_shorten_url_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "premium", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "visits", force: :cascade do |t|
    t.integer "visitor_id", null: false
    t.integer "shorten_url_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shorten_url_id"], name: "index_visits_on_shorten_url_id"
    t.index ["visitor_id"], name: "index_visits_on_visitor_id"
  end

end
