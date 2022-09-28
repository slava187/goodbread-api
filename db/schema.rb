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

ActiveRecord::Schema[7.0].define(version: 2022_08_23_183901) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "folders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_folders_on_user_id"
  end

  create_table "ordered_lists", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.string "title", null: false
    t.string "list_items", array: true
    t.integer "index_order", null: false
    t.string "component_type", default: "ol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_ordered_lists_on_recipe_id"
  end

  create_table "recipe_folder_joins", force: :cascade do |t|
    t.bigint "folder_id"
    t.bigint "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["folder_id"], name: "index_recipe_folder_joins_on_folder_id"
    t.index ["recipe_id"], name: "index_recipe_folder_joins_on_recipe_id"
  end

  create_table "recipe_sub_folder_joins", force: :cascade do |t|
    t.bigint "sub_folder_id"
    t.bigint "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_recipe_sub_folder_joins_on_recipe_id"
    t.index ["sub_folder_id"], name: "index_recipe_sub_folder_joins_on_sub_folder_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title", null: false
    t.text "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "sub_folders", force: :cascade do |t|
    t.bigint "folder_id", null: false
    t.string "title", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["folder_id"], name: "index_sub_folders_on_folder_id"
  end

  create_table "tag_recipe_joins", force: :cascade do |t|
    t.bigint "recipe_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_tag_recipe_joins_on_recipe_id"
    t.index ["tag_id"], name: "index_tag_recipe_joins_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "label", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "textboxes", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.string "title", null: false
    t.string "text_content"
    t.integer "index_order", null: false
    t.string "component_type", default: "textbox"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_textboxes_on_recipe_id"
  end

  create_table "unordered_lists", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.string "title", null: false
    t.string "list_items", array: true
    t.integer "index_order", null: false
    t.string "component_type", default: "ul"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_unordered_lists_on_recipe_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "email", null: false
    t.string "password_digest", null: false
    t.text "description"
    t.string "user_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "folders", "users"
  add_foreign_key "ordered_lists", "recipes"
  add_foreign_key "recipe_folder_joins", "folders"
  add_foreign_key "recipe_folder_joins", "recipes"
  add_foreign_key "recipe_sub_folder_joins", "recipes"
  add_foreign_key "recipe_sub_folder_joins", "sub_folders"
  add_foreign_key "recipes", "users"
  add_foreign_key "sub_folders", "folders"
  add_foreign_key "tag_recipe_joins", "recipes"
  add_foreign_key "tag_recipe_joins", "tags"
  add_foreign_key "textboxes", "recipes"
  add_foreign_key "unordered_lists", "recipes"
end
