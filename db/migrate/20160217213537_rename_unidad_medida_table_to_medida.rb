class RenameUnidadMedidaTableToMedida < ActiveRecord::Migration
  def change
    
    rename_table :unidad_medidas, :medidas
  end
end
