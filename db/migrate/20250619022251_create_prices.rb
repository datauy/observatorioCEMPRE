class CreatePrices < ActiveRecord::Migration[8.0]
  def change
    create_table :prices do |t|
      t.references :material, null: false, foreign_key: true
      t.references :buyer, null: false, foreign_key: true
      t.integer :value

      t.timestamps
    end
  end
end
