class CreateZoos < ActiveRecord::Migration[6.1]
  def change
    create_table :zoos do |t|


      t.string :name, null: false
      t.string :favorite, null: false
      t.string :zoo_type, null: false
      t.string :assessment, null: false
      t.string :address, null: false
      t.integer :user_id, null: false


      t.timestamps
    end
  end
end
