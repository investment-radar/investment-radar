# frozen_string_literal: true

module DecisionEngine
  class BaseClient
    BASE_URL = ENV['DECISION_ENGINE_BASE_URL'] || 'https://dry-falls-81080.herokuapp.com/'

    def initialize(token)
      @token = token
    end

    # TODO: :reek:NilCheck
    def call(symbol)
      response = connection.get api_url(symbol)

      response.body if response&.success?
    end

    def api_url(_symbol)
      raise NotImplementedError
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
