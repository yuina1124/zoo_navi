class Animal < ApplicationRecord

  has_many :zoo_animals, dependent: :destroy
  has_many :zoo, through: :zoo_animals

  has_one_attached :image

end
