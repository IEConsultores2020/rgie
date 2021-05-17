class CreateFabricantes < ActiveRecord::Migration
  def change
    create_table :fabricantes do |t|
      t.string :nombre
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :fabricantes, :users
  end
end
