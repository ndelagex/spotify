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

ActiveRecord::Schema.define(version: 2019_07_09_152129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "playlists", force: :cascade do |t|
    t.string "description"
    t.string "SpotifyId"
    t.string "name"
    t.string "ownerName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ownerId"
    t.integer "is_vocal", default: 1
    t.integer "is_dancing", default: 1
    t.integer "is_day", default: 1
    t.integer "is_robot", default: 1
    t.integer "is_summer", default: 1
    t.integer "is_urban", default: 1
    t.text "danceability"
    t.text "energy"
    t.text "loudness"
    t.text "speechiness"
    t.text "acousticness"
    t.text "instrumentalness"
    t.text "liveness"
    t.text "valence"
    t.text "tempo"
    t.string "artistId"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
