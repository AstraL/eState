class AddParentDistrictIdToDistricts < ActiveRecord::Migration[5.1]
  def change
    add_column :districts, :parent_area_id, :integer, default: 0
  end
end
