class AddNumFacturaToInventarios < ActiveRecord::Migration
  def change
    add_column :inventarios, :num_factura, :string
  end
end
