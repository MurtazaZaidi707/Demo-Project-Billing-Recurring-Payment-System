# frozen_string_literal: true

class Transactionuser < ApplicationRecord
  belongs_to :subscribe
  belongs_to :user
end
