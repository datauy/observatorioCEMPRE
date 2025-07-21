class AddCategoryToMaterial < ActiveRecord::Migration[8.0]
  def change
    add_column :materials, :category, :integer
  end
end
