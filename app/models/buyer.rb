class Buyer < ApplicationRecord
  has_many :requirements
  has_many :material_relations
  has_many :materials, through: :material_relations

  has_one :country, class_name: "Buyer", foreign_key: 'buyer_id'
  has_many :buyers, class_name: "Buyer", foreign_key: 'buyer_id'

  enum :semaphore, [
    'Verde',
    'Amarillo',
    'Rojo'
  ]
  enum :btype, [
    'País',
    'Intermediario',
    'Empresa pequeña',
    'Empresa grande'
  ]

  def self.ransackable_attributes(auth_object = nil)
    ["address", "btype", "coordinates", "country_id", "created_at", "description", "id", "name", "semaphore", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["buyer"]
  end
end
