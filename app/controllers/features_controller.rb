# frozen_string_literal: true

class FeaturesController < ApplicationController
  def index; end

  def create
    @plan = Plan.find(params[:plan_id])
    @feature = @plan.features.create(feature_params)
    redirect_to new_usage_path(feature_id: @feature.id)
  end

  private

  def feature_params
    params.require(:feature).permit(:name, :code, :unit_price, :max_unit_limit, :plan_id)
  end
end
