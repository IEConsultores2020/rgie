class CreateArticulos < ActiveRecord::Migration
  def change
    create_table :articulos do |t|
      t.string :nombre
      t.string :descripcion
      t.string :foto
      t.string :barcode
      t.belongs_to :unidad_medida, index: true
      t.belongs_to :componente, index: true
      t.belongs_to :modelo, index: true

      t.timestamps null: false
    end
    add_foreign_key :articulos, :unidad_medidas
    add_foreign_key :articulos, :componentes
    add_foreign_key :articulos, :modelos
  end
end
