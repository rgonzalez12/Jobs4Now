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

ActiveRecord::Schema.define(version: 2020_05_26_191001) do

  create_table "event_registrations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.index ["event_id", "user_id"], name: "index_event_registrations_on_event_id_and_user_id", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.datetime "event_time"
    t.string "name"
    t.string "description"
    t.string "agenda"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "location"
    t.integer "attendee_id"
  end

  create_table "job_applications", force: :cascade do |t|
    t.integer "job_id"
    t.integer "user_id"
    t.index ["job_id", "user_id"], name: "index_job_applications_on_job_id_and_user_id", unique: true
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "user_id"
    t.text "description"
    t.text "requirements"
    t.string "compensation"
    t.string "duration"
    t.string "schedule"
    t.string "field_of_work"
    t.string "contact_info"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "location"
    t.integer "applicant_id"
  end

  create_table "mastery", force: :cascade do |t|
    t.integer "skill_id"
    t.integer "user_id"
    t.integer "star_rating"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.string "review_info"
    t.integer "user_id"
    t.integer "job_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.string "field"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "email"
    t.string "password_digest"
    t.string "phone_number"
    t.string "address"
    t.string "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "resume"
    t.text "cover_letter"
  end

end
