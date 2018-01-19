# frozen_string_literal: true

module FinanceClient
  class DecisionEngine
    BASE_URL = 'https://dry-falls-81080.herokuapp.com/'

    class << self
      # TODO: :reek:NilCheck
      def long_term_stock(symbol)
        api_url = "/long_term_stocks/#{symbol}"
        response = connection.get api_url

        JSON.parse(response.body) if response&.success?
      end

      private

      def connection
        conn = Faraday.new(url: BASE_URL) do |faraday|
          faraday.adapter Faraday.default_adapter
          # faraday.response :logger # for debug
        end
        conn.headers['Authorization'] = 'Token sZNZRxtUynovTLZxKeDDatjH'

        conn
      end
    end
  end
end
