# frozen_string_literal: true

class RenameTransactionusersToPayments < ActiveRecord::Migration[6.1]
  def change
    rename_table :transactionusers, :payments
  end
end
