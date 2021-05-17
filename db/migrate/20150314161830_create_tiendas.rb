class CreateTiendas < ActiveRecord::Migration
  def change
    create_table :tiendas do |t|
      t.string :nombre
      t.string :descripcion
      t.belongs_to :empresa, index: true

      t.timestamps null: false
    end
    add_foreign_key :tiendas, :empresas
  end
end
