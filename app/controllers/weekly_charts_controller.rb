# frozen_string_literal: true

class WeeklyChartsController < BaseChartsController
  def index
    render json: [
      weekly_timeseries_data,
      sma_20_weekly_data,
      cost_data
    ]
  end

  private

  def weekly_timeseries_data
    weekly_timeseries = stock.timeseries(type: 'weekly').close
    @weekly_timeseries_data = weekly_timeseries.first(52)

    { name: 'Weekly', data: @weekly_timeseries_data }
  end

  def sma_20_weekly_data
    sma_20_weekly = stock.indicator(function: 'SMA', interval: 'weekly', time_period: '20').sma

    { name: 'MA20', data: sma_20_weekly.first(52) }
  end

  def cost_data
    cost = LongTermStock.find_by(stock_symbol: params[:symbol])&.cost
    return {} unless cost.present?

    first_date = @weekly_timeseries_data.first[0]
    last_date = @weekly_timeseries_data.last[0]
    { name: 'Cost', data: [[first_date, cost], [last_date, cost]] }
  end

  def stock
    @stock ||= alphavantage_client.stock symbol: params[:symbol]
  end
end
