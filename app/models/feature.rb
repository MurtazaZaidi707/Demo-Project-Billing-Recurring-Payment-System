class Feature < ApplicationRecord
  belongs_to :plan
  belongs_to :usage
end
