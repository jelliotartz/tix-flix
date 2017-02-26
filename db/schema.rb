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

ActiveRecord::Schema.define(version: 20170226184753) do

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auditoria", force: :cascade do |t|
    t.string   "title"
    t.integer  "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auditoria_movies", id: false, force: :cascade do |t|
    t.integer "auditorium_id", null: false
    t.integer "movie_id",      null: false
  end

  add_index "auditoria_movies", ["auditorium_id", "movie_id"], name: "index_auditoria_movies_on_auditorium_id_and_movie_id"
  add_index "auditoria_movies", ["movie_id", "auditorium_id"], name: "index_auditoria_movies_on_movie_id_and_auditorium_id"

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.integer  "showtime_id"
    t.integer  "auditorium_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "credit_card_number"
    t.date     "expiration_date"
    t.integer  "movie_id"
    t.integer  "showtime_id"
    t.integer  "auditorium_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "showtimes", force: :cascade do |t|
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
