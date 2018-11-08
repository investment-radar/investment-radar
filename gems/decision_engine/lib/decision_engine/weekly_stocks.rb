module DecisionEngine
  class WeeklyStocks < BaseClient
    def api_url(symbol)
      "/weekly_stocks/#{symbol}"
    end
  end
end
