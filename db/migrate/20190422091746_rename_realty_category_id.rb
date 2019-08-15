class RenameRealtyCategoryId < ActiveRecord::Migration[5.2]
  def change
    rename_column :realties, :category_id, :realty_category_id
  end
end
