class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :path
      t.timestamps
    end
    add_index :sources, :path, unique: true
  end
end
