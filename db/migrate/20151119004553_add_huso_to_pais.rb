class AddHusoToPais < ActiveRecord::Migration
  def change
    add_column :pais, :huso, :string
  end
end
