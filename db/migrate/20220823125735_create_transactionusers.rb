# frozen_string_literal: true

class CreateTransactionusers < ActiveRecord::Migration[6.1]
  def change
    create_table :transactionusers do |t|
      t.integer :user_id
      t.date :transaction_date
      t.integer :subscribe_id

      t.timestamps
    end
    add_index :transactionusers, :user_id
    add_index :transactionusers, :subscribe_id
  end
end
