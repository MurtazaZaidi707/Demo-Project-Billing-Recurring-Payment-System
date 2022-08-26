# frozen_string_literal: true

class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def show
    @plan = Plan.find(params[:id])
  end

  # GET /users/1/edit
  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])

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
    @plan = Plan.find(params[:id])
    @plan.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to plans_url, notice: 'Plan was successfully destroyed.' }
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:monthly_fee, :name)
  end
end
