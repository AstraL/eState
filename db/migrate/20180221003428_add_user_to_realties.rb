class AddUserToRealties < ActiveRecord::Migration[5.1]
  def change
    add_column :realties, :user_id, :integer
  end
end
