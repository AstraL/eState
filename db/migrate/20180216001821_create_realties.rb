class CreateRealties < ActiveRecord::Migration[5.1]
  def change
    create_table :realties do |t|
      t.integer :crm_id
      t.boolean :is_new_building
      t.string :title
      t.text :description
      t.integer :category_id
      t.integer :realty_type_id
      t.integer :deal_id
      t.integer :region_id
      t.integer :city_id
      t.integer :district_id
      t.integer :microdistrict_id
      t.string :street
      t.string :house_num
      t.float :map_lat
      t.float :map_lng
      t.string :apartment
      t.string :landmark
      t.integer :total_floors
      t.integer :floor
      t.float :area_total
      t.float :area_living
      t.float :area_kitchen
      t.integer :room_count
      t.integer :price_value
      t.string :price_currency

      t.boolean :gas
      t.float :ceiling_height
      t.boolean :exclusive
      t.integer :bedroom_count
      t.string :wall_material
      t.string :renovation
      t.integer :bathroom_count
      t.string :planing
      t.string :realty_class
      t.string :room_schema
      t.integer :year
      t.integer :balcony_count
      t.string :windows
      t.string :ownership
      t.string :ceiling_material
      t.string :entrance
      t.string :plumbing
      t.string :purpose
      t.boolean :active
      t.integer :commission

      t.datetime :crm_created_at
      t.datetime :crm_updated_at

      t.timestamps
    end
  end
end
