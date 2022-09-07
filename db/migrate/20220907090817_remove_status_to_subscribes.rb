# frozen_string_literal: true

class RemoveStatusToSubscribes < ActiveRecord::Migration[6.1]
  def change
    remove_column :subscribes, :status
  end
end
