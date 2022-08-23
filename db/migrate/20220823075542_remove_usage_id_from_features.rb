# frozen_string_literal: true

class RemoveUsageIdFromFeatures < ActiveRecord::Migration[6.1]
  def change
    remove_index :features, :usage_id
    remove_column :features, :usage_id, :integer
  end
end
