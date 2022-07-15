class ZooAnimal < ApplicationRecord

  belongs_to :zoo, optional: true
  belongs_to :animal, optional: true

end
