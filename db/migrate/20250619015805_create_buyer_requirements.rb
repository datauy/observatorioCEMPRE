class CreateBuyerRequirements < ActiveRecord::Migration[8.0]
  def change
    create_table :buyer_requirements do |t|
      t.string :name
      t.text :description
      t.references :buyer, null: false, foreign_key: true
      t.references :requirement_category, null: false, foreign_key: true
      t.integer :semaphore
      t.references :material, null: false, foreign_key: true

      t.timestamps
    end
  end
end
