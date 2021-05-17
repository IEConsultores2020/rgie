class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_reference :users, :ciudad, index: true
    add_foreign_key :users, :ciudads
  end
end
