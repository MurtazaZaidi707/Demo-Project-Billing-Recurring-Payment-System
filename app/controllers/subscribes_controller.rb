class SubscribesController < ApplicationController
  def index
    @subscribes = Subscribe.all
  end

end
