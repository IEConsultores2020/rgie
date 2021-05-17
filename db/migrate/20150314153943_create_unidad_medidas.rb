class CreateUnidadMedidas < ActiveRecord::Migration
  def change
    create_table :unidad_medidas do |t|
      t.string :codigo
      t.string :nombre
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
