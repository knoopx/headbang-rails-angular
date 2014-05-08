class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :number
      t.string :title
      t.integer :bitrate
      t.integer :length
      t.string :path
      t.string :type
      t.integer :play_count, default: 0
      t.belongs_to :artist
      t.belongs_to :release
      t.timestamps
    end

    add_index :tracks, :path, unique: true
  end
end
