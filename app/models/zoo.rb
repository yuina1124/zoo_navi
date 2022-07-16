class Zoo < ApplicationRecord

  has_many :zoo_animals, dependent: :destroy
  has_many :animals, through: :zoo_animals
  belongs_to :user

  has_one_attached :image

  def save_animal(sent_animals)
    current_animals = self.animals.pluck(:name) unless self.animals.nil?
    old_animals = current_animals - sent_animals
    new_animals = sent_animals - current_animals

    old_animals.each do |old|
      self.animals.delete Animal.find_by(name: old)
    end

    new_animals.each do |new|
      new_zoo_animal = Animal.find_or_create_by(name: new)
      self.animals << new_zoo_animal
    end
  end

end
