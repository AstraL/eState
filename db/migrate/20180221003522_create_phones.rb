class CreatePhones < ActiveRecord::Migration[5.1]
  def change
    create_table :phones do |t|
      t.string :purpose
      t.string :number
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
