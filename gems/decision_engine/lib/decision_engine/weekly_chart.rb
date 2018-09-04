# frozen_string_literal: true

module DecisionEngine
  class WeeklyChart < BaseClient
    def api_url(symbol)
      "/weekly_chart/#{symbol}"
    end
  end
end
