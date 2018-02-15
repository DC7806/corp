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

ActiveRecord::Schema.define(version: 20180215140340) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "permalink"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_product_relations", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_category_product_relations_on_category_id"
    t.index ["product_id"], name: "index_category_product_relations_on_product_id"
  end

  create_table "certificate_product_relations", force: :cascade do |t|
    t.bigint "certificate_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["certificate_id"], name: "index_certificate_product_relations_on_certificate_id"
    t.index ["product_id"], name: "index_certificate_product_relations_on_product_id"
  end

  create_table "certificates", force: :cascade do |t|
    t.string "image"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faqs", force: :cascade do |t|
    t.string "lang"
    t.text "question"
    t.text "answer"
    t.string "sort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "src"
    t.string "alt"
    t.integer "sort"
    t.string "imagable_type"
    t.bigint "imagable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "lang"
    t.index ["imagable_type", "imagable_id"], name: "index_images_on_imagable_type_and_imagable_id"
  end

  create_table "meta", force: :cascade do |t|
    t.string "page_name"
    t.string "title"
    t.string "meta_description"
    t.string "og_title"
    t.string "og_description"
    t.string "og_image"
    t.string "metable_type"
    t.bigint "metable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["metable_type", "metable_id"], name: "index_meta_on_metable_type_and_metable_id"
  end

  create_table "mobility_string_translations", force: :cascade do |t|
    t.string "locale"
    t.string "key"
    t.string "value"
    t.integer "translatable_id"
    t.string "translatable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["translatable_id", "translatable_type", "key"], name: "index_mobility_string_translations_on_translatable_attribute"
    t.index ["translatable_id", "translatable_type", "locale", "key"], name: "index_mobility_string_translations_on_keys", unique: true
    t.index ["translatable_type", "key", "value", "locale"], name: "index_mobility_string_translations_on_query_keys"
  end

  create_table "mobility_text_translations", force: :cascade do |t|
    t.string "locale"
    t.string "key"
    t.text "value"
    t.integer "translatable_id"
    t.string "translatable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["translatable_id", "translatable_type", "key"], name: "index_mobility_text_translations_on_translatable_attribute"
    t.index ["translatable_id", "translatable_type", "locale", "key"], name: "index_mobility_text_translations_on_keys", unique: true
  end

  create_table "news", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "permalink"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "model"
    t.string "country"
    t.string "document"
    t.string "inquiry"
    t.string "permalink"
    t.text "feature"
    t.text "specification"
    t.text "dimensions"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "translations", force: :cascade do |t|
    t.string "locale"
    t.string "key"
    t.text "value"
    t.text "interpolations"
    t.boolean "is_proc", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "category_product_relations", "categories"
  add_foreign_key "category_product_relations", "products"
  add_foreign_key "certificate_product_relations", "certificates"
  add_foreign_key "certificate_product_relations", "products"
end
