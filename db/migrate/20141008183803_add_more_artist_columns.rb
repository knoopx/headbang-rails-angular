class AddMoreArtistColumns < ActiveRecord::Migration
  def change
    add_column :artists, :last_fm, :text
    add_column :artists, :music_brainz, :text
    add_column :artists, :discogs, :text
  end
end
