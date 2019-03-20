# frozen_string_literal: true

class PositionsController < ApplicationController
  attr_reader :stock
  before_action :find_stock, only: [:ack]

  def index
    long_term_stocks = LongTermStock.all.order(:notified_at)

    @cost_chart_data = {}
    @market_chart_data = {}
    @total_cost = 0
    @total_market_value = 0
    @total_risk = 0

    long_term_stocks.each do |stock|
      @cost_chart_data[stock.stock_symbol] = stock.total_cost
      @market_chart_data[stock.stock_symbol] = stock.market_value
      @total_cost += stock.total_cost
      @total_market_value += stock.market_value
      @total_risk += stock.calculated_lost
    end

    @long_term_stocks = long_term_stocks.sort_by(&:calculated_change)

    @total_gain = @total_market_value - @total_cost
    @cash = LongTermStock::TOTAL_CAPITAL - @total_cost
    @total_risk_percentage = ((@total_risk * 100).to_f / LongTermStock::TOTAL_CAPITAL).round(2)
  end

  def ack
    stock.update!(acked_at: Time.current)

    respond_to do |format|
      format.js
    end
  end

  private

  def find_stock
    @stock ||= LongTermStock.find(params[:id])
  end
end
