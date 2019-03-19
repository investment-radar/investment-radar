# frozen_string_literal: true

module FinanceClient
  class Stock
    BASE_URL = 'https://cloud.iexapis.com'
    API_VERSION = 'beta'
    TOKEN = Rails.application.credentials.iex_token

    class << self
      # TODO: :reek:NilCheck
      def quote(symbol, params = { token: TOKEN })
        quote_url = "/#{API_VERSION}/stock/#{symbol}/quote"
        response = connection.get quote_url, params

        JSON.parse(response.body) if response&.success?
      end

      private

      def connection
        Faraday.new(url: BASE_URL) do |faraday|
          faraday.adapter Faraday.default_adapter
          # faraday.response :logger # for debug
        end
      end
    end
  end
end
