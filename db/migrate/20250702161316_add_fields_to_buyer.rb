class AddFieldsToBuyer < ActiveRecord::Migration[8.0]
  def change
    add_column :buyers, :email, :string
    add_column :buyers, :website, :string
    add_column :buyers, :phone, :string
  end
end
