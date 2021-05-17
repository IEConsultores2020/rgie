class AddMedidaRefToArticulos < ActiveRecord::Migration
  def change
    add_reference :articulos, :medida, index: true
    add_foreign_key :articulos, :medidas
  end
end
