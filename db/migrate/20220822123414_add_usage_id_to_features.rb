class AddUsageIdToFeatures < ActiveRecord::Migration[6.1]
  def change
    add_column :features, :usage_id, :integer
    add_index :features, :usage_id
  end
end
