# frozen_string_literal: true

class PaymentsController < ApplicationController
  def index
    @payments = current_user.payments
  end

  def new
    @payment = Payment.new(transaction_date: params[:billing_date], subscribe_id: params[:subscribe_id])
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.user_id = current_user.id

    if @payment.save
      redirect_to new_invoice_path(subscribe_id: @payment.subscribe_id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:subscribe_id, :transaction_date)
  end
end
