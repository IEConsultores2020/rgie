class CreatePais < ActiveRecord::Migration
  def change
    create_table :pais do |t|
      t.string :name
      t.date :huso
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :pais, :users
  end
end
