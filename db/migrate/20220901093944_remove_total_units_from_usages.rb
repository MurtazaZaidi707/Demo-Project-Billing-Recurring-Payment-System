class RemoveTotalUnitsFromUsages < ActiveRecord::Migration[6.1]
  def change
    remove_column :usages, :total_units, :integer
  end
end
