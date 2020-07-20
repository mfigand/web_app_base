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

ActiveRecord::Schema.define(version: 2020_07_13_063134) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "roles", force: :cascade do |t|
    t.integer "name", null: false
    t.integer "resource"
    t.integer "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_at"], name: "index_roles_on_created_at"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource"], name: "index_roles_on_resource"
    t.index ["resource_id"], name: "index_roles_on_resource_id"
    t.index ["updated_at"], name: "index_roles_on_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_at"], name: "index_users_on_created_at"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email"
    t.index ["lastname"], name: "index_users_on_lastname"
    t.index ["name"], name: "index_users_on_name"
    t.index ["password_digest"], name: "index_users_on_password_digest"
    t.index ["updated_at"], name: "index_users_on_updated_at"
  end

  create_table "users_roles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_at"], name: "index_users_roles_on_created_at"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["updated_at"], name: "index_users_roles_on_updated_at"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", unique: true
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

end
