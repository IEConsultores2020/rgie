class CreateKardexes < ActiveRecord::Migration
  def change
    create_table :kardexes do |t|
      t.integer :valor_compra
      t.integer :valor_venta
      t.date :fecha_ingreso
      t.references :inventario, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
