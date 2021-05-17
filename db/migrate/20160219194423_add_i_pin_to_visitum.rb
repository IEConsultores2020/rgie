class AddIPinToVisitum < ActiveRecord::Migration
  def change
    add_column :visita, :IPin, :string
  end
end
