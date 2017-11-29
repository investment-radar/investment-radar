# frozen_string_literal: true

# Service Concern
# Adds call class method, that:
# - creates a new instance with arguments,
# - invokes call on the new instance
module Concerns
  module Service
    extend ActiveSupport::Concern

    included do
      def self.call(*args)
        new(*args).call
      end
    end
  end
end
