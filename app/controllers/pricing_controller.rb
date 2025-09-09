class PricingController < ApplicationController
  def index
    period = params[:period]
    hotel  = params[:hotel]
    room   = params[:room]

    render json: { rate: "12000" }
  end
end
