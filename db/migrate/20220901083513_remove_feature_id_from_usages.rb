class RemoveFeatureIdFromUsages < ActiveRecord::Migration[6.1]
  def change
    remove_index :usages, :feature_id
    remove_column :usages, :feature_id, :integer
  end
end
