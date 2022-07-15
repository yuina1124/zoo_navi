class CreateZooAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :zoo_animals do |t|

      t.integer :zoo_id
      t.integer :animal_id

      t.references :zoo, foreign_key: true
      t.references :animal, foreign_key: true

      t.timestamps null: false
    end
  end
end
