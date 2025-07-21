class Material < ApplicationRecord
  has_many :buyers
  has_many :prices
  has_many :requirements

  enum :category, [
    'Celulósicos',
    'Plásticos',
    'Vidrios',
    'Metales',
    'Multilaminados',
  ]
  def self.ransackable_attributes(auth_object = nil)
    ["color", "created_at", "description", "id", "name", "updated_at", "category"]
  end

end
