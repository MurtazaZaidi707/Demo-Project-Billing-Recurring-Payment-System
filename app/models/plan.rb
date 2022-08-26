# frozen_string_literal: true

class Plan < ApplicationRecord
  # belongs_to :user
  validates :monthly_fee, presence: true
  validates :name, presence: true

  has_many :features, dependent: :destroy

  has_many :users
  has_many :users, through: :subscribes
end
