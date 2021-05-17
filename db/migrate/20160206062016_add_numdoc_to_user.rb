class AddNumdocToUser < ActiveRecord::Migration
  def change
    add_column :users, :numdoc, :string
  end
end
