class AddPlanIdToFeatures < ActiveRecord::Migration[6.1]
  def change
    add_column :features, :plan_id, :integer
    add_index :features, :plan_id
  end
end
