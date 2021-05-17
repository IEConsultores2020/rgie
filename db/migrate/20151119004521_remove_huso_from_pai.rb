class RemoveHusoFromPai < ActiveRecord::Migration
  def change
    remove_column :pais, :huso, :date
  end
end
