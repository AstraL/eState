class AddSlugToRealties < ActiveRecord::Migration[5.1]
  def change
    add_column :realties, :slug, :string
  end
end
