# frozen_string_literal: true

class CreateUsages < ActiveRecord::Migration[6.1]
  def change
    create_table :usages do |t|
      t.integer :user_id
      t.integer :unit_consumed
      t.integer :total_units
      t.integer :feature_id

      t.timestamps
    end
    add_index :usages, :user_id
    add_index :usages, :feature_id
  end
end
