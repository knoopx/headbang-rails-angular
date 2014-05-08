class CreateLabelsReleases < ActiveRecord::Migration
  def change
    create_table :label_releases do |t|
      t.belongs_to :label, index: true
      t.belongs_to :release, index: true
      t.timestamps
    end
  end
end
