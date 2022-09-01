class RemoveUsageIdFromInvoices < ActiveRecord::Migration[6.1]
  def change
    remove_index :invoices, :usage_id
    remove_column :invoices, :usage_id, :integer
  end
end
