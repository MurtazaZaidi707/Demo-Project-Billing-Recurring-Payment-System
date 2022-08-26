# frozen_string_literal: true

class Feature < ApplicationRecord
  validates :name, presence: true
  validates :code, presence: true
  validates :unit_price, presence: true
  validates :max_unit_limit, presence: true

  belongs_to :plan
  has_one :usage, dependent: :destroy
end
