class Buyer < ApplicationRecord
  belongs_to :country

  enum :semaphore, [
    'Verde',
    'Amarillo',
    'Rojo'
  ]
  enum :btype, [
    'Intermediario',
    'Empresa pequeña',
    'Empresa grande'
  ]

  def self.ransackable_attributes(auth_object = nil)
    ["address", "btype", "coordinates", "country_id", "created_at", "description", "id", "name", "semaphore", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["country"]
  end
end
