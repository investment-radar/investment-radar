# frozen_string_literal: true

module MaCalculator
  def self.wma_30(stock_symbol)
    yahoo_client = YahooFinance::Client.new

    start_date = Time.current - (24 * 60 * 60 * 7 * 31)

    weekly_data = yahoo_client.historical_quotes(
      stock_symbol,
      period: :weekly,
      start_date: start_date,
      end_date: Time.current
    )
    # 平时跟tradingview的数值，保持一致，TODO: 接下来观察周末的情况
    MovingAvg::Base.wma(weekly_data[1..30].map(&:close))
  end

  def self.ma_10(stock_symbol)
    yahoo_client = YahooFinance::Client.new

    start_date = Time.current - (24 * 60 * 60 * 7 * 11)

    weekly_data = yahoo_client.historical_quotes(
      stock_symbol,
      period: :weekly,
      start_date: start_date,
      end_date: Time.current
    )

    MovingAvg::Base.sma(weekly_data[0..9].map(&:close))
  end
end
