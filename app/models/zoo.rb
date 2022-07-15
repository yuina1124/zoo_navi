class Zoo < ApplicationRecord

  has_many :zoo_animals, dependent: :destroy
  has_many :animals, through: zoo_animals
  belongs_to :user

  has_one_attached :image

end
