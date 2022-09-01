# frozen_string_literal: true

class PaymentsController < ApplicationController
  def index
    @payments = current_user.payments
  end

  def new
    @payment = Payment.new(invoice_id: params[:invoice_id], transaction_date: params[:billing_date], subscribe_id: params[:subscribe_id])
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.user_id = current_user.id

    if @payment.save
      params[:payment_id] = @payment.id
      redirect_to payment_usage_path(params[:payment_id], subscribe_id: @payment.subscribe_id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def usage
    if request.get?
      render :usage
    else
      @usage = current_user.usages.new(usage_params)

      if @usage.save
        redirect_to usages_path
      else
        render :usage
      end
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:subscribe_id, :transaction_date, :invoice_id)
  end

  def usage_params
    params.permit(:unit_consumed, :subscribe_id, :payment_id)
  end
end
