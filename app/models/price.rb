class Price < ApplicationRecord
  belongs_to :buyer
  belongs_to :material

  def self.ransackable_attributes(auth_object = nil)
    ["buyer_id", "created_at", "id", "material_id", "updated_at", "value", "min_value", "max_value", "description", "source"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["buyer", "material"]
  end
end
