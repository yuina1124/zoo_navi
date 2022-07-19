class Animal < ApplicationRecord

  has_many :zoo_animals, dependent: :destroy, foreign_key: 'animal_id'
  has_many :zoos, through: :zoo_animals
  belongs_to :user

  validates :name, uniqueness: {scope: :user_id}, presence: true

  has_one_attached :image


end
