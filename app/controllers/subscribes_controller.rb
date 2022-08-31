# frozen_string_literal: true

class SubscribesController < ApplicationController
  def index
    @subscribes = Subscribe.all
  end

  def new
    @subscribe = Subscribe.new(plan_id: params[:plan_id])
  end

  def create
    @subscribe = Subscribe.new(subscribe_params)
    @subscribe.user_id = current_user.id

    if @subscribe.save
      redirect_to new_invoice_path(subscribe_id: @subscribe.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def subscribe_params
    params.require(:subscribe).permit(:plan_id, :billing_date)
  end
end
