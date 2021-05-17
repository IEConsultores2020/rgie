class CreatePuntoventa < ActiveRecord::Migration
  def change
    create_table :puntoventa do |t|
      t.string :name
      t.integer :mtsmaxdistancia
      t.decimal :latitude, precision: 9, scale: 6
      t.decimal :longitude, precision: 9, scale: 6
      t.string :direccion
      t.string :telefonos
      t.string :email
      t.belongs_to :tipocanal, index: true
      t.belongs_to :ciudad, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :puntoventa, :tipocanals
    add_foreign_key :puntoventa, :ciudads
    add_foreign_key :puntoventa, :users
  end
end
