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
      redirect_to plans_index_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def subscribe_params
      params.require(:subscribe).permit(:user_id, :plan_id, :billing_date)
    end

end
