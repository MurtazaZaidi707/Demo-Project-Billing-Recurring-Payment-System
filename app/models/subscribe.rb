# frozen_string_literal: true

class Subscribe < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  has_one :transactionusers

  validates :billing_date, presence: true

  before_validation :ensure_current_date
  after_validation :validate_date_range

  private

  def validate_date_range
    first_date = Date.new(2022, 8, 1)
    last_date = Date.new(2022, 8, 28)

    if billing_date? && !(billing_date >= first_date && billing_date <= last_date)
      errors.add(:billing_date, 'Is not in billing range 1-28')
    end
  end

  def ensure_current_date
    last_date = Date.new(2022, 8, 20)

    self.billing_date = last_date if Date.today > last_date
  end
end
