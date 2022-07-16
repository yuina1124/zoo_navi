class CreateAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :animals do |t|

      t.string :name, null: false
      t.string :introduction
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
