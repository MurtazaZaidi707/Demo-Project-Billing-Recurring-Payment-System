# frozen_string_literal: true

class AddUnitConsumedToInvoices < ActiveRecord::Migration[6.1]
  def change
    add_column :invoices, :unit_consumed, :integer
  end
end
