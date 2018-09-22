class PositionsController < ApplicationController
  def index
    @long_term_stocks = LongTermStock.all.order(:notified_at)
  end
end
