class AddDetailsToCiudad < ActiveRecord::Migration
  def change
    add_reference :ciudads, :region, index: true
    add_foreign_key :ciudads, :regions
  end
end
