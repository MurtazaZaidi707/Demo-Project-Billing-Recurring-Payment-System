class Invoice < ApplicationRecord
  belongs_to :user
  belongs_to :subscribe
  belongs_to :usage
end
