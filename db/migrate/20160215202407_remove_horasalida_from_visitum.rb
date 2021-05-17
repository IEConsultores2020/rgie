class RemoveHorasalidaFromVisitum < ActiveRecord::Migration
  def change
    remove_column :visita, :horasalida, :date
  end
end
