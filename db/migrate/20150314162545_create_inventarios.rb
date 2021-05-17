class CreateInventarios < ActiveRecord::Migration
  def change
    create_table :inventarios do |t|
      t.date :fecha_ingreso
      t.string :moneda
      t.string :cantidad_integer
      t.integer :valor_unidad
      t.integer :valor_total
      t.belongs_to :tienda, index: true
      t.belongs_to :articulo, index: true

      t.timestamps null: false
    end
    add_foreign_key :inventarios, :tiendas
    add_foreign_key :inventarios, :articulos
  end
end
