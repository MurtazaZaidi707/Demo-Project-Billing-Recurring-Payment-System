# frozen_string_literal: true

class Usage < ApplicationRecord
  validates :unit_consumed, presence: true

  belongs_to :user
  belongs_to :payment
  belongs_to :subscribe
end
