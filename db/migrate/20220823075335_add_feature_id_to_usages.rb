# frozen_string_literal: true

class AddFeatureIdToUsages < ActiveRecord::Migration[6.1]
  def change
    add_column :usages, :feature_id, :integer
    add_index :usages, :feature_id
  end
end
