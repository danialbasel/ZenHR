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

ActiveRecord::Schema[7.0].define(version: 2023_01_15_173632) do
  create_table "job_applications", force: :cascade do |t|
    t.integer "User_id", null: false
    t.boolean "Seen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "job_posts_id", null: false
    t.index ["User_id"], name: "index_job_applications_on_User_id"
    t.index ["job_posts_id"], name: "index_job_applications_on_job_posts_id"
  end

  create_table "job_posts", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "Email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.index ["Email"], name: "index_users_on_Email", unique: true
  end

  add_foreign_key "job_applications", "Users"
  add_foreign_key "job_applications", "job_posts", column: "job_posts_id"
end
