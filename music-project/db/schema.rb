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

ActiveRecord::Schema.define(version: 2022_10_12_101638) do

  create_table "artists", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "song_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_artists_on_name"
  end

  create_table "downloads", force: :cascade do |t|
    t.integer "song_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["song_id"], name: "index_downloads_on_song_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "title", null: false
    t.integer "length", null: false
    t.integer "filesize", null: false
    t.integer "artist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "downloads_count"
    t.index ["artist_id"], name: "index_songs_on_artist_id"
    t.index ["downloads_count"], name: "index_songs_on_downloads_count"
    t.index ["title"], name: "index_songs_on_title"
  end

  add_foreign_key "songs", "artists"
  add_foreign_key "downloads", "songs"
end
