class MaterialRelation < ApplicationRecord
  belongs_to :material
  belongs_to :buyer
end
