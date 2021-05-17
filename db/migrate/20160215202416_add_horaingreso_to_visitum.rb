class AddHoraingresoToVisitum < ActiveRecord::Migration
  def change
    add_column :visita, :horaingreso, :datetime
  end
end
