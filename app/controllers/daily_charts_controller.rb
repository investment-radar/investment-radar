# frozen_string_literal: true

class DailyChartsController < BaseChartsController
  def index
    symbol = params[:symbol]
    stock = alphavantage_client.stock symbol: symbol

    ema_13_daily = stock.indicator(function: 'EMA', interval: 'daily', time_period: '13').ema
    ema_34_daily = stock.indicator(function: 'EMA', interval: 'daily', time_period: '34').ema

    render json: [{ name: 'EMA13', data: ema_13_daily.first(200) }, { name: 'EMA34', data: ema_34_daily.first(200) }]
  end
end
