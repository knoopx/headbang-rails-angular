class CreateGenresReleases < ActiveRecord::Migration
  def change
    create_table :genre_releases do |t|
      t.belongs_to :release, index: true
      t.belongs_to :genre, index: true
      t.timestamps
    end
  end
end
