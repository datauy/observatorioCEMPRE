class CountryRequirement < ApplicationRecord
  belongs_to :country
  belongs_to :requirement_category
  belongs_to :material

  enum :semaphore, [
    'Verde',
    'Amarillo',
    'Rojo'
  ]

  def self.ransackable_attributes(auth_object = nil)
    ["country_id", "created_at", "description", "id", "material_id", "name", "requirement_category_id", "semaphore", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["country", "material", "requirement_category"]
  end
end
