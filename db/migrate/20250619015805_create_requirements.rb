class CreateBuyerRequirements < ActiveRecord::Migration[8.0]
  def change
    create_table :requirements do |t|
      t.references :requirement_category, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.references :material, null: false, foreign_key: true
      t.references :buyer, null: false, foreign_key: true
      t.integer :semaphore

      t.timestamps
    end
  end
end
