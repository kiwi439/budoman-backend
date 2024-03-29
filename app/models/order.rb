# frozen_string_literal: true

class Order < ApplicationRecord
  DELIVERIES_DETAILS = [
    { method: 'in_post', price: 10.99 },
    { method: 'dpd', price: 15.99 },
    { method: 'pick_up_at_the_point', price: 0.0 }
  ].freeze

  ALLOWED_PAYMENT_METHOD = %w[cash_payment traditional_transfer].freeze
  PHONE_NUMBER_REGEX = /\A[0-9]{9}\z/

  belongs_to :user
  has_many :products_orders, dependent: :destroy

  validates :delivery_method, inclusion: { in: DELIVERIES_DETAILS.pluck(:method) }
  validates :payment_method, inclusion: { in: ALLOWED_PAYMENT_METHOD }
  validates :phone_number, format: { with: PHONE_NUMBER_REGEX }
end
