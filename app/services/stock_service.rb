class StockService
  include Concerns::Service

  SELL_ACTION = "sell".freeze
  HOLD_ACTION = "hold".freeze

  attr_reader :long_term_stocks, :yahoo_client

  def initialize(stocks, yahoo_client)
    #load_up_stocks =
    @long_term_stocks = stocks
    @yahoo_client = yahoo_client
  end

  def call
    stock_symbols = long_term_stocks.keys

    results = yahoo_client.quotes(stock_symbols, [:bid, :last_trade_price], { na_as_nil: true, raw: true })

    results.each do |result|
      target_price = long_term_stocks[result.symbol]
      result.target_price = target_price

      next unless result.bid

      if result.bid.to_f < target_price
        result.action = SELL_ACTION
      else
        result.action = HOLD_ACTION
      end
    end
  end
end
