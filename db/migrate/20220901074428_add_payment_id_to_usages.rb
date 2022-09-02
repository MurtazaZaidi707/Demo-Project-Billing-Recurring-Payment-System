# frozen_string_literal: true

class AddPaymentIdToUsages < ActiveRecord::Migration[6.1]
  def change
    add_column :usages, :payment_id, :integer
    add_index :usages, :payment_id
  end
end
