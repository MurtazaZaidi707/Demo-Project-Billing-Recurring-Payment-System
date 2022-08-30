# frozen_string_literal: true

class FeaturesController < ApplicationController
  before_action :set_feature, only: %i[show edit update destroy]
  before_action :set_plan, only: %i[show edit update destroy]

  def index; end

  def create
    @plan = Plan.find(params[:plan_id])
    # @feature = @plan.feature.build(params[:feature])
    @feature = @plan.features.create(feature_params)
    if @feature.persisted?
      redirect_to plan_feature_usage_path(params[:plan_id], @feature.id, max_units: @feature.max_unit_limit)
    else
      # byebug
      render 'plans/show'
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
    @feature = Feature.find(params[:id])
  end

  def set_plan
    @plan = Plan.find(params[:plan_id])
  end

  def feature_params
    params.require(:feature).permit(:name, :code, :unit_price, :max_unit_limit, :plan_id)
  end

  def usage_params
    params.permit(:user_id, :unit_consumed, :total_units, :feature_id)
  end
end
