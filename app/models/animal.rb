class Animal < ApplicationRecord

  has_many :zoo_animals, dependent: :destroy, foreign_key: 'animal_id'
  has_many :zoo, through: :zoo_animals

  validates :name, uniqueness: true, presence: true

  has_one_attached :image

end
