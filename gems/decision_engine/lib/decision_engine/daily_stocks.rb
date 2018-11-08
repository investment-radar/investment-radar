module DecisionEngine
  class DailyStocks < BaseClient
    def api_url(symbol)
      "/daily_stocks/#{symbol}"
    end
  end
end
