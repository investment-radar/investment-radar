# frozen_string_literal: true

module StockApiHelpers
  def stub_long_term_stocks(stock_symbol, options = {})
    api_url = "https://dry-falls-81080.herokuapp.com/long_term_stocks/#{stock_symbol}"
    status = options.fetch(:status, 200)

    response_body = options.fetch(:response_body, {
      symbol: stock_symbol,
      decision: 'sell'
    }.to_json)

    stub_request(:get, api_url).to_return(status: status, body: response_body, headers: {})
  end

  def stub_quote_request(stock_symbol, options = {})
    quote_url = "https://cloud.iexapis.com/beta/stock/#{stock_symbol}/quote?token=#{FinanceClient::Stock::TOKEN}"
    status = options.fetch(:status, 200)

    response_body = options.fetch(:response_body, {
      symbol: stock_symbol.upcase,
      latestPrice: 53.99
    }.to_json)

    stub_request(:get, quote_url).to_return(status: status, body: response_body, headers: {})
  end
end
