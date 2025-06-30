class AddParentToBuyer < ActiveRecord::Migration[8.0]
  def change
    add_reference :buyers, :buyer, foreign_key: true
  end
end
