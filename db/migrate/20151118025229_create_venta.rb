class CreateVenta < ActiveRecord::Migration
  def change
    create_table :venta do |t|
      t.date :fecha
      t.integer :qexistencia
      t.integer :qventa
      t.belongs_to :puntoventum, index: true
      t.belongs_to :equipo, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :venta, :puntoventa
    add_foreign_key :venta, :equipos
    add_foreign_key :venta, :users
  end
end
