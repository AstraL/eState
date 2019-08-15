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

ActiveRecord::Schema.define(version: 2019_04_22_091746) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
  end

  create_table "cities", id: false, force: :cascade do |t|
    t.integer "city_id", null: false
    t.string "name"
    t.string "translit"
    t.integer "region_id"
    t.index ["city_id"], name: "index_cities_on_city_id", unique: true
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "deals", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "districts", id: false, force: :cascade do |t|
    t.integer "district_id", null: false
    t.string "name"
    t.integer "city_id"
    t.bigint "parent_district_id"
    t.index ["district_id"], name: "index_districts_on_district_id", unique: true
    t.index ["parent_district_id"], name: "index_districts_on_parent_district_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "person"
    t.string "question"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "images", force: :cascade do |t|
    t.string "url"
    t.integer "realty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string "purpose"
    t.string "number"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_phones_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.integer "category_id"
    t.text "body"
    t.string "image"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
  end

  create_table "realties", force: :cascade do |t|
    t.integer "crm_id"
    t.boolean "is_new_building"
    t.string "title"
    t.text "description"
    t.integer "realty_category_id"
    t.integer "realty_type_id"
    t.integer "deal_id"
    t.integer "region_id"
    t.integer "city_id"
    t.integer "district_id"
    t.integer "microdistrict_id"
    t.string "street"
    t.string "house_num"
    t.float "map_lat"
    t.float "map_lng"
    t.string "apartment"
    t.string "landmark"
    t.integer "total_floors"
    t.integer "floor"
    t.float "area_total"
    t.float "area_living"
    t.float "area_kitchen"
    t.integer "room_count"
    t.integer "price_value"
    t.string "price_currency"
    t.boolean "gas"
    t.float "ceiling_height"
    t.boolean "exclusive"
    t.integer "bedroom_count"
    t.string "wall_material"
    t.string "renovation"
    t.integer "bathroom_count"
    t.string "planing"
    t.string "realty_class"
    t.string "room_schema"
    t.integer "year"
    t.integer "balcony_count"
    t.string "windows"
    t.string "ownership"
    t.string "ceiling_material"
    t.string "entrance"
    t.string "plumbing"
    t.string "purpose"
    t.boolean "active"
    t.integer "commission"
    t.datetime "crm_created_at"
    t.datetime "crm_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "slug"
  end

  create_table "realty_categories", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "realty_types", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", id: false, force: :cascade do |t|
    t.integer "region_id", null: false
    t.string "name"
    t.string "translit"
    t.index ["region_id"], name: "index_regions_on_region_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.string "avatar"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
