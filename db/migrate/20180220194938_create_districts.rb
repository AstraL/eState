class CreateDistricts < ActiveRecord::Migration[5.1]
  def change
    create_table :districts, id: false do |t|
		    t.integer :district_id, null: false
		    t.string :name
        t.integer :city_id
        t.references :parent_district, index: true
    end

    add_index :districts, :district_id, unique: true
  end
end
