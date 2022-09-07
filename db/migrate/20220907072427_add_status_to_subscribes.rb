# frozen_string_literal: true

class AddStatusToSubscribes < ActiveRecord::Migration[6.1]
  def change
    add_column :subscribes, :status, :string
  end
end
