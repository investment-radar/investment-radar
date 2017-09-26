class StockService
  include Concerns::Service

  attr_reader :long_term_stocks, :yahoo_client

  def initialize(stocks, yahoo_client)
    @long_term_stocks = stocks
    @yahoo_client = yahoo_client
  end

  def call
    stock_symbols = long_term_stocks.map(&:stock_symbol)
    results = yahoo_client.quotes(stock_symbols, [:bid, :last_trade_price], { na_as_nil: true, raw: true })

    results.each do |result|
      long_term_stock = long_term_stocks.find_by(stock_symbol: result.symbol)
      long_term_stock.update_action(result)
    end
  end
end
