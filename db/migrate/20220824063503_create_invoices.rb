# frozen_string_literal: true

class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.integer :user_id
      t.integer :subscribe_id
      t.integer :usage_id
      t.integer :total_amount

      t.timestamps
    end
    add_index :invoices, :user_id
    add_index :invoices, :subscribe_id
    add_index :invoices, :usage_id
  end
end
