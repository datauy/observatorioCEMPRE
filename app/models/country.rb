class Country < ApplicationRecord

  enum :semaphore, [
    'Verde',
    'Amarillo',
    'Rojo'
  ]

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "name", "semaphore", "updated_at"]
  end

end
