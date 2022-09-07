# frozen_string_literal: true

class AddStatusToInvoices < ActiveRecord::Migration[6.1]
  def change
    add_column :invoices, :status, :string
  end
end
