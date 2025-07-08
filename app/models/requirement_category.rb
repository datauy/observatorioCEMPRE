class RequirementCategory < ApplicationRecord

  has_many :requirements

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "name", "updated_at"]
  end

end
