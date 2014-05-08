class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.integer :play_count, default: 0
      t.string :discogs_id
      t.string :last_fm_id
      t.string :last_fm_url
      t.string :music_brainz_id
      t.integer :releases_count, default: 0
      t.timestamps
    end
    
    add_index :artists, :name, unique: true
  end
end
