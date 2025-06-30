class Material < ApplicationRecord
  has_many :buyers
  has_many :prices
  has_many :requirements

  def self.ransackable_attributes(auth_object = nil)
    ["color", "created_at", "description", "id", "name", "updated_at"]
  end

end
