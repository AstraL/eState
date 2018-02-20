class CreateRegions < ActiveRecord::Migration[5.1]
  def change
    create_table :regions, id: false do |t|
      t.integer :region_id, null: false
      t.string :name
      t.string :translit
    end

    add_index :regions, :region_id, unique: true
  end
end
