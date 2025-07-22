class AddDataToBuyer < ActiveRecord::Migration[8.0]
  def change
    add_column :buyers, :market, :integer
    add_column :buyers, :anual_volume, :integer
    add_column :buyers, :mensual_volume, :integer
  end
end
