class CreateBuyers < ActiveRecord::Migration[8.0]
  def change
    create_table :buyers do |t|
      t.string :name
      t.text :description
      t.references :country, null: false, foreign_key: true
      t.string :address
      t.string :coordinates
      t.integer :semaphore
      t.integer :btype

      t.timestamps
    end
  end
end
