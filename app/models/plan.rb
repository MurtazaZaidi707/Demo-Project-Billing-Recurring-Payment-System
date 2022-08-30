# frozen_string_literal: true

class Plan < ApplicationRecord
  # belongs_to :user
  validates :monthly_fee, presence: true
  validates :name, presence: true

  has_many :features, dependent: :destroy
  accepts_nested_attributes_for :features, allow_destroy: true, reject_if: :has_values?
  validates_associated :features

  has_many :users
  has_many :users, through: :subscribes

  def has_values?
    attributes['features_attributes']&.any? do |a|
        a['name'].present? || a['code'].present?
    end
  end
end
