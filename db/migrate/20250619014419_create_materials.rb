class CreateMaterials < ActiveRecord::Migration[8.0]
  def change
    create_table :materials do |t|
      t.string :name
      t.text :description
      t.string :color

      t.timestamps
    end
  end
end
