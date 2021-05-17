class CreateVisita < ActiveRecord::Migration
  def change
    create_table :visita do |t|
      t.date :horaingreso
      t.date :horasalida
      t.belongs_to :planvisitum, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :visita, :planvisita
    add_foreign_key :visita, :users
  end
end
