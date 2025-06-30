class CreateMaterialRelations < ActiveRecord::Migration[8.0]
  def change
    create_table :material_relations do |t|
      t.references :material, null: false, foreign_key: true
      t.references :buyer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
