class CheckoutController < ApplicationController
  def create
    #invoice = Invoice.find(params[:id])
    #plan = invoice.subscribe.plan
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          unit_amount: 100,
          currency: "usd",
          product_data: {
            name: 'T-shirt',
            description: 'Comfortable cotton t-shirt',
            images: ['https://example.com/t-shirt.png'],
          }
        },
      quantity: 1,
      }],
      mode: 'payment',
      success_url:  root_url,
      cancel_url: root_url,
    })
    respond_to do |format|
      format.js
    end
  end
end
