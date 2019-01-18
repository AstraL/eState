class CreateRealtyTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :realty_types do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
  end
end
