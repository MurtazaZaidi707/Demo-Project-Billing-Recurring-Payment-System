# frozen_string_literal: true

class AddBillingDateToSubscribes < ActiveRecord::Migration[6.1]
  def change
    add_column :subscribes, :billing_date, :date
  end
end
