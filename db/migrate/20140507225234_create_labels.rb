class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.string :name
      t.integer :releases_count, default: 0
      t.timestamps
    end
    
    add_index :labels, :name, unique: true
  end
end
