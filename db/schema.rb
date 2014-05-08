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

ActiveRecord::Schema.define(version: 20141008183803) do

  create_table "artists", force: true do |t|
    t.string   "name"
    t.integer  "play_count",      default: 0
    t.string   "discogs_id"
    t.string   "last_fm_id"
    t.string   "last_fm_url"
    t.string   "music_brainz_id"
    t.integer  "releases_count",  default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "last_fm"
    t.text     "music_brainz"
    t.text     "discogs"
  end

  add_index "artists", ["name"], name: "index_artists_on_name", unique: true

  create_table "collections", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "collections_releases", id: false, force: true do |t|
    t.integer "collection_id"
    t.integer "release_id"
  end

  add_index "collections_releases", ["collection_id"], name: "index_collections_releases_on_collection_id"
  add_index "collections_releases", ["release_id"], name: "index_collections_releases_on_release_id"

  create_table "countries", force: true do |t|
    t.string   "name"
    t.integer  "releases_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "countries", ["name"], name: "index_countries_on_name", unique: true

  create_table "genre_releases", force: true do |t|
    t.integer  "release_id"
    t.integer  "genre_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "genre_releases", ["genre_id"], name: "index_genre_releases_on_genre_id"
  add_index "genre_releases", ["release_id"], name: "index_genre_releases_on_release_id"

  create_table "genres", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "genres", ["name"], name: "index_genres_on_name", unique: true

  create_table "label_releases", force: true do |t|
    t.integer  "label_id"
    t.integer  "release_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "label_releases", ["label_id"], name: "index_label_releases_on_label_id"
  add_index "label_releases", ["release_id"], name: "index_label_releases_on_release_id"

  create_table "labels", force: true do |t|
    t.string   "name"
    t.integer  "releases_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "labels", ["name"], name: "index_labels_on_name", unique: true

  create_table "releases", force: true do |t|
    t.string   "title",           limit: 1024
    t.string   "year"
    t.string   "catalog_number"
    t.string   "artwork_url"
    t.string   "path",            limit: 1024
    t.string   "type"
    t.integer  "play_count",                   default: 0
    t.string   "discogs_id"
    t.string   "music_brainz_id"
    t.string   "last_fm_id"
    t.string   "last_fm_url"
    t.integer  "country_id"
    t.integer  "artist_id"
    t.integer  "genres_count",                 default: 0
    t.integer  "labels_count",                 default: 0
    t.integer  "tracks_count",                 default: 0
    t.datetime "released_at"
    t.integer  "release_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "releases", ["artist_id"], name: "index_releases_on_artist_id"
  add_index "releases", ["country_id"], name: "index_releases_on_country_id"
  add_index "releases", ["path"], name: "index_releases_on_path", unique: true
  add_index "releases", ["release_id"], name: "index_releases_on_release_id"

  create_table "sources", force: true do |t|
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sources", ["path"], name: "index_sources_on_path", unique: true

  create_table "tracks", force: true do |t|
    t.integer  "number"
    t.string   "title"
    t.integer  "bitrate"
    t.integer  "length"
    t.string   "path"
    t.string   "type"
    t.integer  "play_count", default: 0
    t.integer  "artist_id"
    t.integer  "release_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tracks", ["path"], name: "index_tracks_on_path", unique: true

end
