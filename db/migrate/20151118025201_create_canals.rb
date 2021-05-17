class CreateCanals < ActiveRecord::Migration
  def change
    create_table :canals do |t|
      t.string :name
      t.belongs_to :tipocanal, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :canals, :tipocanals
    add_foreign_key :canals, :users
  end
end
