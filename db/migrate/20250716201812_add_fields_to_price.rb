class AddFieldsToPrice < ActiveRecord::Migration[8.0]
  def change
    add_column :prices, :max_value, :integer
    add_column :prices, :min_value, :integer
    add_column :prices, :last_update, :date
    add_column :prices, :source, :string
    add_column :prices, :description, :text
  end
end
