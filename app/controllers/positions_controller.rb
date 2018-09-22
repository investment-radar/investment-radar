class PositionsController < ApplicationController
  def index
    @long_term_stocks = LongTermStock.all.order(:notified_at)
  end

  def ack
    @stock = LongTermStock.find(params[:id])
    @stock.update(acked_at: Time.current)

    respond_to do |format|
      format.js
    end
  end
end
