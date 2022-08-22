class Subscribe < ApplicationRecord
  belongs_to :user
  belongs_to :plan

  validates :billing_date, presence: true
  validate :validate_date_range


  def validate_date_range
    first_date = Date.new(2022, 8, 1)
    last_date = Date.new(2022, 8, 28)

    if(billing_date?)
      if ! (billing_date > first_date && billing_date < last_date)
        errors.add(:billing_date, "Is not in billing range 1-28")
      end
    end

  end



end
