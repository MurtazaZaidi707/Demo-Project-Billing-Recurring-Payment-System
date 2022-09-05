# frozen_string_literal: true

class PlansController < ApplicationController
  before_action :set_plan, only: %i[show edit update destroy]
  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed

  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def show
    @feature = @plan.features.build
    @display_feature = @plan.features
  end

  # GET /users/1/edit
  def edit; end

  def update
    if @plan.update(plan_params)
      redirect_to @plan
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # POST /users or /users.json
  def create
    @plan = Plan.new(plan_params)

    if @plan.valid? && @plan.save
      redirect_to @plan
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @plan.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to plans_url, notice: 'Plan was successfully destroyed.' }
    end
  end

  private

  def set_plan
    @plan = Plan.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(:monthly_fee, :name,
                                 features_attributes: %i[id name code unit_price max_unit_limit _destroy])
  end

  def not_destroyed(err)
    render json: { errors: err.record.errors }, status: :unprocessable_entity
  end

end
