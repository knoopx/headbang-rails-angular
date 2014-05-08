class CreateCollectionsReleases < ActiveRecord::Migration
  def change
    create_table :collections_releases, id: false do |t|
      t.belongs_to :collection, index: true
      t.belongs_to :release, index: true
    end
  end
end
