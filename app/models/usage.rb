class Usage < ApplicationRecord

  belongs_to :user
  has_one :feature
end
