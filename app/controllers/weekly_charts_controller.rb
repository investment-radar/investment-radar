# frozen_string_literal: true

class WeeklyChartsController < BaseChartsController
  def index
    render json: [{ name: 'Weekly', data: weekly_timeseries_data }, { name: 'MA20', data: sma_20_weekly_data }]
  end

  private

  def weekly_timeseries_data
    weekly_timeseries = stock.timeseries(type: 'weekly').close
    weekly_timeseries.first(52)
  end

  def sma_20_weekly_data
    sma_20_weekly = stock.indicator(function: 'SMA', interval: 'weekly', time_period: '20').sma
    sma_20_weekly.first(52)
  end

  def stock
    @stock ||= alphavantage_client.stock symbol: params[:symbol]
  end
end
