class CreateEquipos < ActiveRecord::Migration
  def change
    create_table :equipos do |t|
      t.string :referencia
      t.integer :descontinuado
      t.belongs_to :fabricante, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :equipos, :fabricantes
    add_foreign_key :equipos, :users
  end
end
