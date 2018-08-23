# frozen_string_literal: true

module DecisionEngine
  class LongTermStock
    BASE_URL = 'https://dry-falls-81080.herokuapp.com/'

    def initialize(token)
      @token = token
    end

    # TODO: :reek:NilCheck
    def call(symbol)
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
      conn.headers['Authorization'] = "Token #{@token}"

      conn
    end
  end
end
