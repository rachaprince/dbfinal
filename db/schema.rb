# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151207200409) do

  create_table "away_ratings", force: :cascade do |t|
    t.integer  "internship_id"
    t.integer  "committee_id"
    t.integer  "visa"
    t.integer  "rating"
    t.text     "explanation"
    t.integer  "experience_difficulties"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "away_ratings", ["committee_id"], name: "index_away_ratings_on_committee_id"
  add_index "away_ratings", ["internship_id"], name: "index_away_ratings_on_internship_id"

  create_table "committees", force: :cascade do |t|
    t.string   "name"
    t.string   "region"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "home_ratings", force: :cascade do |t|
    t.integer  "participant_id"
    t.integer  "committee_id"
    t.integer  "rating"
    t.text     "explanation"
    t.integer  "prep_rating"
    t.text     "prep_explanation"
    t.integer  "prior_difficulties"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "home_ratings", ["committee_id"], name: "index_home_ratings_on_committee_id"
  add_index "home_ratings", ["participant_id"], name: "index_home_ratings_on_participant_id"

  create_table "internship_committees", force: :cascade do |t|
    t.integer  "internship_id"
    t.integer  "home_c_id"
    t.integer  "away_c_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "internship_committees", ["away_c_id"], name: "index_internship_committees_on_away_c_id"
  add_index "internship_committees", ["home_c_id"], name: "index_internship_committees_on_home_c_id"
  add_index "internship_committees", ["internship_id"], name: "index_internship_committees_on_internship_id"

  create_table "internships", force: :cascade do |t|
    t.string   "product"
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "key_learning"
    t.integer  "overall_rating"
    t.text     "overall_expl"
    t.integer  "internship_rating"
    t.text     "internship_expl"
    t.integer  "participant_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "provided_difficulties"
  end

  add_index "internships", ["participant_id"], name: "index_internships_on_participant_id"

  create_table "participants", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
