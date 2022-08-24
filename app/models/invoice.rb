# frozen_string_literal: true

class Invoice < ApplicationRecord
  belongs_to :user
  belongs_to :subscribe
  belongs_to :usage
end
