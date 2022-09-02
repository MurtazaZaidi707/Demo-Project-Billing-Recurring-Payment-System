# frozen_string_literal: true

class UsagesController < ApplicationController
  before_action :set_usage, only: %i[show edit update destroy]

  def index
    @usages = if current_user.type == 'Admin'
                Usage.all
              else
                current_user.usages
              end
  end

  def show; end

  def new
    @usage = Usage.new(feature_id: params[:feature_id])
  end

  def create
    @usage = Usage.new(usage_params)

    if @usage.save
      redirect_to usages_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @usage.update(usage_params)
      redirect_to usages_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_usage
    @usage = Usage.find(params[:id])
  end

  def usage_params
    params.require(:usage).permit(:unit_consumed, :user_id, :feature_id)
  end
end
