class AddHorasalidaToVisitum < ActiveRecord::Migration
  def change
    add_column :visita, :horasalida, :datetime
  end
end
