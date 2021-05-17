class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :regions, :users
  end
end
