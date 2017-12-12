class CreateDistricts < ActiveRecord::Migration[5.1]
  def change
    create_table :districts do |t|
      t.integer :city_id
      t.integer :area_id
      t.string :name
      t.integer :level
    end
  end
end
