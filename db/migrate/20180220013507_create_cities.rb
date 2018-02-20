class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities, id: false do |t|
      t.integer :city_id, null: false
      t.string :name
      t.string :translit
      t.integer :region_id
    end

    add_index :cities, :city_id, unique: true
  end
end
