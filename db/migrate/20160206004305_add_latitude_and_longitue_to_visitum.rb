class AddLatitudeAndLongitueToVisitum < ActiveRecord::Migration
  def change
    add_column :visita, :latitude, :float
    add_column :visita, :longitude, :float
  end
end
