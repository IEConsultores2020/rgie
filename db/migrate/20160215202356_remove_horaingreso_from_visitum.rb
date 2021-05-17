class RemoveHoraingresoFromVisitum < ActiveRecord::Migration
  def change
    remove_column :visita, :horaingreso, :date
  end
end
