class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.integer :city_id
      t.integer :state_id
      t.string :name
      t.string :translit
    end
  end
end
