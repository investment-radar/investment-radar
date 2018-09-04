# frozen_string_literal: true

module DecisionEngine
  class DailyChart < BaseClient
    def api_url(symbol)
      "/daily_chart/#{symbol}"
    end
  end
end
