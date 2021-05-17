class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :nombre
      t.string :webpage
      t.string :email

      t.timestamps null: false
    end
  end
end
