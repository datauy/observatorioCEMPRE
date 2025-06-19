class Price < ApplicationRecord
  belongs_to :country
  belongs_to :material

  def self.ransackable_attributes(auth_object = nil)
    ["country_id", "created_at", "id", "material_id", "updated_at", "value"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["country", "material"]
  end
end
