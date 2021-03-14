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

ActiveRecord::Schema.define(version: 2021_03_14_185938) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer "meal_id"
    t.integer "content"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nutrient_hash"
    t.float "total_lipid"
    t.float "protein"
    t.float "water"
    t.float "carbs"
    t.float "fiber"
    t.float "starch"
    t.float "total_sugar"
    t.float "sucrose"
    t.float "glucose"
    t.float "fructose"
    t.float "lactose"
    t.float "galactose"
    t.float "ash"
    t.float "calcium"
    t.float "iron"
    t.float "magnesium"
    t.float "sodium"
    t.float "zinc"
    t.float "copper"
    t.float "selenium"
    t.float "vitamin_a"
    t.float "vitamin_a_r"
    t.float "vitamin_d"
    t.float "vitamin_e"
    t.float "vitamin_c"
    t.float "thiamin"
    t.float "riboflavin"
    t.float "niacin"
    t.float "pantothenic"
    t.float "vitamin_b6"
    t.float "total_folate"
    t.float "folic_acid"
    t.float "food_folate"
    t.float "folate_dfe"
    t.float "vitamin_b12"
    t.float "cholesterol"
    t.float "sat_fats"
    t.float "poly_unsat_fats"
    t.integer "calories"
    t.integer "kj"
  end

  create_table "meal_foods", force: :cascade do |t|
    t.integer "meal_id"
    t.integer "food_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "published", default: false
    t.integer "comments_count"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
