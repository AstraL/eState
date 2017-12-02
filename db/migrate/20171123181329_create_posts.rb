class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :category_id
      t.text :body
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
