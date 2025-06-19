class Material < ApplicationRecord

  def self.ransackable_attributes(auth_object = nil)
    ["color", "created_at", "description", "id", "name", "updated_at"]
  end

end
