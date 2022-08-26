# frozen_string_literal: true

class PlansController < ApplicationController

  before_action :set_feature, only: %i[show edit update destroy]

  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def show; end

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

    if @plan.save
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

  def set_feature
    @plan = Plan.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(:monthly_fee, :name)
  end
end
