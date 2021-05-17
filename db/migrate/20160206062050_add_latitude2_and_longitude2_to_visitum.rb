class AddLatitude2AndLongitude2ToVisitum < ActiveRecord::Migration
  def change
    add_column :visita, :latitude2, :float
    add_column :visita, :longitude2, :float
  end
end
