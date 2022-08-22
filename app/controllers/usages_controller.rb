class UsagesController < ApplicationController
  def index
    @usages = Usage.all
  end

  def show
    @usage = Usage.find(params[:id])
  end

  def new
    @usage = Usage.new
  end

  def create
    @usage = Usage.new(usage_params)

    if @usage.save
      redirect_to new_plan_path(usage_id: @usage.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def usage_params
      params.require(:usage).permit(:unit_consumed, :total_units, :user_id)
    end
end
