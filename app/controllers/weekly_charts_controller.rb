# frozen_string_literal: true

class WeeklyChartsController < ApplicationController
  def index
    client = Alphavantage::Client.new key: 'Q8KDMSMYB6O7TDZS'
    symbol = params[:symbol]
    stock = client.stock symbol: symbol

    timeseries = stock.timeseries type: 'weekly'
    weekly = timeseries.close.first(52)

    indicator = stock.indicator function: 'SMA', interval: 'weekly', time_period: '20'
    ma20 = indicator.sma.first(52)

    render json: [{ name: 'Weekly', data: weekly }, { name: 'MA20', data: ma20 }]
  end
end
