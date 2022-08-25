# frozen_string_literal: true

class Usage < ApplicationRecord

  validates :unit_consumed, presence: true

  belongs_to :user
  belongs_to :feature

  has_one :invoice
end
