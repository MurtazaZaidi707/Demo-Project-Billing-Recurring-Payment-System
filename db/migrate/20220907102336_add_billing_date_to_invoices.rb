# frozen_string_literal: true

class AddBillingDateToInvoices < ActiveRecord::Migration[6.1]
  def change
    add_column :invoices, :billing_date, :date
  end
end
