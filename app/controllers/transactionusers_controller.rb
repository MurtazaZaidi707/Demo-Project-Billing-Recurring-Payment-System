# frozen_string_literal: true

class TransactionusersController < ApplicationController
  def index
    @transactionusers = current_user.transactionusers
  end

  def new
    @transactionuser = Transactionuser.new(transaction_date: params[:billing_date], subscribe_id: params[:subscribe_id])
  end

  def create
    @transactionuser = Transactionuser.new(transactionuser_params)

    if @transactionuser.save
      redirect_to new_invoice_path(subscribe_id: @transactionuser.subscribe_id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def transactionuser_params
    params.require(:transactionuser).permit(:subscribe_id, :transaction_date)
  end
end
