# frozen_string_literal: true

class Invoice < ApplicationRecord
  belongs_to :user
  belongs_to :subscribe
  has_one :payment
end
