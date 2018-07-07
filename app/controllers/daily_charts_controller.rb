# frozen_string_literal: true

class DailyChartsController < ApplicationController
  def index
    client = Alphavantage::Client.new key: 'Q8KDMSMYB6O7TDZS'
    symbol = params[:symbol]
    stock = client.stock symbol: symbol

    indicator = stock.indicator function: 'EMA', interval: 'daily', time_period: '13'
    ema13 = indicator.ema.first(200)
    indicator = stock.indicator function: 'EMA', interval: 'daily', time_period: '34'
    ema34 = indicator.ema.first(200)

    render json: [{ name: 'EMA13', data: ema13 }, { name: 'EMA34', data: ema34 }]
  end
end
