class CreateZooAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :zoo_animals do |t|

      t.integer :zoo_id
      t.integer :animal_id

      t.timestamps null: false
    end
    add_index :zoo_animals, [:zoo_id, :animal_id], unique: true
  end
end
