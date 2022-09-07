# frozen_string_literal: true

class CheckoutController < ApplicationController
  def create
    invoice = Invoice.find(params[:id])
    plan = invoice.subscribe.plan
    @session = Stripe::Checkout::Session.create({
                                                  payment_method_types: ['card'],
                                                  line_items: [{
                                                    price_data: {
                                                      unit_amount: invoice.total_amount,
                                                      currency: 'usd',
                                                      product_data: {
                                                        name: plan.name
                                                      }
                                                    },
                                                    quantity: 1
                                                  }],
                                                  mode: 'payment',
                                                  success_url: root_url,
                                                  cancel_url: root_url
                                                })
    respond_to do |format|
      format.js
    end
  end
end
