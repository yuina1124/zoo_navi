class Zoo < ApplicationRecord

  has_many :zoo_animals, dependent: :destroy
  has_many :animals, through: :zoo_animals
  belongs_to :user

  has_one_attached :image

  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1},presence: true

  def save_animal(sent_animals, animal_ids, user)
    current_animals = self.animals.pluck(:name) unless self.animals.nil?
    old_animals = current_animals - sent_animals
    new_animals = sent_animals - current_animals

    # 古くて使われていないタグを削除
    old_animals.each do |old|
      self.animals.delete Animal.find_by(name: old, user_id: user.id)
    end

    byebug
    # 新しいタグをテーブルに追加
    new_animals.each do |new|
      new_zoo_animal = Animal.find_or_create_by(name: new, user_id: user.id)
      self.animals << new_zoo_animal
    end

    # 既存のチェックボックスタグの追加処理
    animal_ids.each do |animal_id|
      self.zoo_animals.find_or_create_by(zoo_id: self.id, animal_id: animal_id) unless animal_id.blank?
    end
  end
end
