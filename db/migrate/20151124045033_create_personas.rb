class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.belongs_to :user, index: true
      t.integer :usuarioasignado
      t.belongs_to :ciudad, index: true

      t.timestamps null: false
    end
    add_foreign_key :personas, :users
    add_foreign_key :personas, :ciudads
  end
end
