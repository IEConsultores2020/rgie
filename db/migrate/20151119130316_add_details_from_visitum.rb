class AddDetailsFromVisitum < ActiveRecord::Migration
  def change
    add_reference :visita, :puntoventum, index: true
    add_foreign_key :visita, :puntoventa
  end
end
