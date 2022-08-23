# frozen_string_literal: true

class UsagesController < ApplicationController
  def index
    @usages = Usage.all
  end

  def show
    @usage = Usage.find(params[:id])
  end

  def new
    @usage = Usage.new
    @usage.feature_id = params[:feature_id]
  end

  def create
    @usage = Usage.new(usage_params)

    if @usage.save
      redirect_to usages_index_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @usage = Usage.find(params[:id])
  end

  def update
    @usage = Usage.find(params[:id])

    if @usage.update(usage_params)
      redirect_to usages_index_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def usage_params
    params.require(:usage).permit(:unit_consumed, :total_units, :user_id, :feature_id)
  end
end
