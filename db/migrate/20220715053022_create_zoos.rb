class CreateZoos < ActiveRecord::Migration[6.1]
  def change
    create_table :zoos do |t|


      t.string :name, null: false
      t.string :favorite, null: false
      t.integer :zoo_type
      t.string :assessment, null: false
      t.string :address, null: false
      t.integer :user_id, null: false
      t.float :rate, null: false, default: 0



      t.timestamps
    end
  end
end
