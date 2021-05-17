class AddIPoutToVisitum < ActiveRecord::Migration
  def change
    add_column :visita, :IPout, :string
  end
end
