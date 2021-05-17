class AddDetailsToVisitum < ActiveRecord::Migration
  def change
    add_reference :visita, :planvisitum, index: true
    add_foreign_key :visita, :planvisita
  end
end
