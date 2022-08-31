# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :subscribe
  belongs_to :user
end
