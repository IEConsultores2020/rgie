class CreateDepartamentos < ActiveRecord::Migration
  def change
    create_table :departamentos do |t|
      t.string :name
      t.date :huso
      t.belongs_to :pais, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :departamentos, :pais
    add_foreign_key :departamentos, :users
  end
end
