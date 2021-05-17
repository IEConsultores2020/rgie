class CreateTipocanals < ActiveRecord::Migration
  def change
    create_table :tipocanals do |t|
      t.string :nombre
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :tipocanals, :users
  end
end
