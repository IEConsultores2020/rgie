class RemoveDetailsFromVisitum < ActiveRecord::Migration
  def change
    remove_reference :visita, :planvisitum, index: true
    remove_foreign_key :visita, :planvisita
  end
end
