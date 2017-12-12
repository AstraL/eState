class CreateRegions < ActiveRecord::Migration[5.1]
  def change
    create_table :regions do |t|
      t.integer :state_id
      t.string :name
      t.string :translit
      t.string :declension
      t.string :region_center
      t.string :center_declension
    end
  end
end
