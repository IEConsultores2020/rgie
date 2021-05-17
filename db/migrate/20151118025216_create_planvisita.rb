class CreatePlanvisita < ActiveRecord::Migration
  def change
    create_table :planvisita do |t|
      t.integer :usuarioasignado
      t.date :fechavisita
      t.belongs_to :puntoventum, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :planvisita, :puntoventa
    add_foreign_key :planvisita, :users
  end
end
