class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.integer :releases_count, default: 0
      t.timestamps
    end

    add_index :countries, :name, unique: true
  end
end
