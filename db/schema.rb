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

ActiveRecord::Schema.define(version: 2021_08_27_094943) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "country"
    t.string "city"
    t.string "address_line1"
    t.string "address_line2"
    t.string "zipcode"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "availabilities", force: :cascade do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.string "status"
    t.integer "cost"
    t.bigint "sitter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "capacity"
    t.boolean "small_type"
    t.boolean "medium_type"
    t.boolean "large_type"
    t.boolean "giant_type"
    t.index ["sitter_id"], name: "index_availabilities_on_sitter_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "rating"
    t.text "body"
    t.bigint "author_id", null: false
    t.bigint "receiver_id", null: false
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_comments_on_author_id"
    t.index ["order_id"], name: "index_comments_on_order_id"
    t.index ["receiver_id"], name: "index_comments_on_receiver_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "status"
    t.integer "cost"
    t.text "description"
    t.bigint "availability_id", null: false
    t.bigint "timeslot_id", null: false
    t.bigint "owner_id", null: false
    t.bigint "sitter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["availability_id"], name: "index_orders_on_availability_id"
    t.index ["owner_id"], name: "index_orders_on_owner_id"
    t.index ["sitter_id"], name: "index_orders_on_sitter_id"
    t.index ["timeslot_id"], name: "index_orders_on_timeslot_id"
  end

  create_table "orders_and_pets", id: false, force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "pet_id"
    t.index ["order_id"], name: "index_orders_and_pets_on_order_id"
    t.index ["pet_id"], name: "index_orders_and_pets_on_pet_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "kind"
    t.string "name"
    t.string "gender"
    t.decimal "years"
    t.integer "weight"
    t.integer "height"
    t.text "description"
    t.bigint "owner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_pets_on_owner_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "photo"
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "timeslots", force: :cascade do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.bigint "availability_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["availability_id"], name: "index_timeslots_on_availability_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "users"
  add_foreign_key "availabilities", "users", column: "sitter_id"
  add_foreign_key "comments", "orders"
  add_foreign_key "comments", "users", column: "author_id"
  add_foreign_key "comments", "users", column: "receiver_id"
  add_foreign_key "orders", "availabilities"
  add_foreign_key "orders", "timeslots"
  add_foreign_key "orders", "users", column: "owner_id"
  add_foreign_key "orders", "users", column: "sitter_id"
  add_foreign_key "pets", "users", column: "owner_id"
  add_foreign_key "profiles", "users"
  add_foreign_key "timeslots", "availabilities"
end
