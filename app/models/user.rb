# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :plans

  has_many :plans
  has_many :plan, through: :subscribes

  has_many :usages
  has_many :invoices
  has_many :payments
end
