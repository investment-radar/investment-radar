class StockService
  include Concerns::Service

  attr_reader :long_term_stocks, :yahoo_client

  def initialize
    #load_up_stocks =
    @long_term_stocks = { "shop" => 98.0, "tsla" => 347.64 }
    @yahoo_client = YahooFinance::Client.new
  end

  def call
    stock_symbols = long_term_stocks.keys

    results = yahoo_client.quotes(stock_symbols, [:bid, :last_trade_price], { na_as_nil: true, raw: false })

    results.each do |result|
      target_price = long_term_stocks[result.symbol]
      result.target_price = target_price
      if result.bid < target_price
        result.action = "sell"
      else
        result.action = "hold"
      end
    end
  end
end
