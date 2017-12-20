class CreateMicrodistricts < ActiveRecord::Migration[5.1]
  def change
    create_table :microdistricts do |t|
      t.string :name
      t.integer :area_id
      t.integer :level
      t.integer :district_id

    end
  end
end
