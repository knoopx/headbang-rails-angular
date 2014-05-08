class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :title, limit: 1024
      t.string :year
      t.string :catalog_number
      t.string :artwork_url
      t.string :path, limit: 1024
      t.string :type
      t.integer :play_count, default: 0
      t.string :discogs_id
      t.string :music_brainz_id
      t.string :last_fm_id
      t.string :last_fm_url
      t.belongs_to :country, index: true
      t.belongs_to :artist, index: true
      t.integer :genres_count, default: 0
      t.integer :labels_count, default: 0
      t.integer :tracks_count, default: 0
      t.datetime :released_at
      t.belongs_to :release, index: true
      t.timestamps
    end

    add_index :releases, :path, unique: true
  end
end
