class LongTermStockService
  include Concerns::Service

  attr_reader :long_term_stocks

  def initialize(stocks)
    @long_term_stocks = stocks
  end

  def call
    long_term_stocks.each do |long_term_stock|
      result = FinanceClient::Stock.quote(long_term_stock.stock_symbol)

      if result.present?
        long_term_stock.update_action(result["latestPrice"], result["previousClose"])
      end
    end
  end
end
