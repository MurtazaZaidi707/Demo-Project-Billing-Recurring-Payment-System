# frozen_string_literal: true

class SubscribesController < ApplicationController
  def index
    @subscribes = Subscribe.all
  end

  def new
    @subscribe = Subscribe.new
    @subscribe.plan_id = params[:plan_id]
  end

  def create
    @subscribe = Subscribe.new(subscribe_params)

    if @subscribe.save
      redirect_to new_transactionuser_path(subscribe_id: @subscribe.id, billing_date: @subscribe.billing_date)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def subscribe_params
    params.require(:subscribe).permit(:user_id, :plan_id, :billing_date)
  end
end
