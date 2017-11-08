module FinanceClient
  class Stock
    BASE_URL = 'https://api.iextrading.com'.freeze
    API_VERSION = '1.0'.freeze

    def self.quote(symbol, params = nil)
      quote_url = "/#{API_VERSION}/stock/#{symbol}/quote"
      response = connection.get quote_url, params

      JSON.parse(response.body) if response&.success?
    end

    private

    def self.connection
      conn = Faraday.new(url: BASE_URL) do |faraday|
        faraday.adapter Faraday.default_adapter
        # faraday.response :logger # for debug
      end
    end
  end
end
