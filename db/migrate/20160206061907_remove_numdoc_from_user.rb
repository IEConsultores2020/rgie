class RemoveNumdocFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :NumDoc, :string
  end
end
