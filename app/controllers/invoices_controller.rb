# frozen_string_literal: true

class InvoicesController < ApplicationController
  def index
    @invoices = current_user.invoices
  end

  def new
    @invoice = Invoice.new(subscribe_id: params[:subscribe_id])
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def create
    @invoice = Invoice.new(invoice_params)

    if @invoice.save
      redirect_to invoices_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:user_id, :subscribe_id, :usage_id, :total_amount)
  end
end
