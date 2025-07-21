class ChangePricesToDecimal < ActiveRecord::Migration[8.0]
  def change
    change_column :prices, :value, :decimal, precision: 8, scale: 2
    change_column :prices, :max_value, :decimal, precision: 8, scale: 2
    change_column :prices, :min_value, :decimal, precision: 8, scale: 2
  end
end
