class CreateZoos < ActiveRecord::Migration[6.1]
  def change
    create_table :zoos do |t|
      

      t.string :name, null: false
      t.string :favorite, null: false
      t.string :type, null: false
      t.string :assessment, null: false
      t.string :address, null: false

      has_one_attached :image

      t.timestamps
    end
  end
end
