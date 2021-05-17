class AddNumDocToUser < ActiveRecord::Migration
  def change
    add_column :users, :NumDoc, :string
  end
end
