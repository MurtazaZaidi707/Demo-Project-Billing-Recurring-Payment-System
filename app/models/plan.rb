class Plan < ApplicationRecord

  #belongs_to :user

  has_many :features

  has_many :users
  has_many :users, through: :subscribes

end
