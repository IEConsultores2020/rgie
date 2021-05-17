class CreateConteos < ActiveRecord::Migration
  def change
    create_table :conteos do |t|
      t.integer :cantidad
      t.string :codbarras
      t.references :inventario, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
