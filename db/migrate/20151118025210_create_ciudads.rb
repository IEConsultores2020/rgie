class CreateCiudads < ActiveRecord::Migration
  def change
    create_table :ciudads do |t|
      t.string :name
      t.decimal :latitude, precision: 9, scale: 6
      t.decimal :longitude, precision: 9, scale: 6
      t.belongs_to :departamento, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :ciudads, :departamentos
    add_foreign_key :ciudads, :users
  end
end
