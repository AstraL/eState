class AddFieldsToFeedback < ActiveRecord::Migration[5.1]
  def change
    add_column :feedbacks, :person, :string
    add_column :feedbacks, :question, :string
  end
end
