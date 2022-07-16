class ZooAnimal < ApplicationRecord

  belongs_to :zoo, optional: true
  belongs_to :animal, optional: true

  validates :animal_id, presence: true
  validates :zoo_id, presence: true

end
