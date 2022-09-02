# frozen_string_literal: true

class AddSubscribeIdToUsages < ActiveRecord::Migration[6.1]
  def change
    add_column :usages, :subscribe_id, :integer
    add_index :usages, :subscribe_id
  end
end
