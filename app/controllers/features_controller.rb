# frozen_string_literal: true

class FeaturesController < ApplicationController

  before_action :set_feature, only: %i[show edit update destroy]

  def index; end

  def create
    @plan = Plan.find(params[:plan_id])
    if @feature = @plan.features.create(feature_params)
      redirect_to plan_feature_usage_path(params[:plan_id], @feature.id)
    else
      redirect_to new_plan_path
    end
  end

  def usage
    redirect_to new_usage_path(feature_id: params[:feature_id])
  end

  def edit; end

  def update
    if @feature.update(feature_params)
      redirect_to plans_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @feature.destroy
    redirect_to plan_path(@feature.plan_id)
  end

  private

  def set_feature
    @plan = Plan.find(params[:plan_id])
    @feature = Feature.find(params[:id])
  end

  def feature_params
    params.require(:feature).permit(:name, :code, :unit_price, :max_unit_limit, :plan_id)
  end
end
