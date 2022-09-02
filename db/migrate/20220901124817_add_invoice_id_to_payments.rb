# frozen_string_literal: true

class AddInvoiceIdToPayments < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :invoice_id, :integer
    add_index :payments, :invoice_id
  end
end
