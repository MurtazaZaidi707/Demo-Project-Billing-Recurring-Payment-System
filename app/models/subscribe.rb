# frozen_string_literal: true

class Subscribe < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  has_one :transactionusers
  has_one :invoices

  before_create :ensure_current_date

  private

  def ensure_current_date
    last_date = Date.new(Date.today.year, Date.today.month, 28)

    self.billing_date = if Date.today.day in 1...28
                          Date.today
                        else
                          last_date
                        end

    # self.billing_date = last_date if Date.today > last_date
  end
end
