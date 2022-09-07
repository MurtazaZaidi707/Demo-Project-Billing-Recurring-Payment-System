# frozen_string_literal: true

class InvoicesController < ApplicationController
  def index
    @invoices = current_user.invoices
  end

  def new
    @invoice = Invoice.new(subscribe_id: params[:subscribe_id])
  end

  def show
    @invoice = current_user.invoices.find(params[:id])

    usage = @invoice.payment.usage
    @invoice.subscribe.plan.features.each do |feature|
      @invoice.total_amount = usage.unit_consumed * feature.unit_price

      if usage.unit_consumed > feature.max_unit_limit
        @exceeded_units = usage.unit_consumed - feature.max_unit_limit
        @exceeded_amount = @exceeded_units * feature.unit_price
      end
    end

    @invoice.save
  end

  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.user_id = current_user.id

    if @invoice.save
      redirect_to new_payment_path(invoice_id: @invoice, subscribe_id: @invoice.subscribe.id,
                                   billing_date: @invoice.subscribe.billing_date)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:subscribe_id, :total_amount, :status)
  end
end
