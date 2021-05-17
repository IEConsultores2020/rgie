class AddValorVentaToInventarios < ActiveRecord::Migration
  def change
    add_column :inventarios, :valor_venta, :integer
  end
end
