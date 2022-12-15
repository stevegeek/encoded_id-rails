# frozen_string_literal: true

require_relative "rails/version"
require_relative "rails/configuration"
require_relative "rails/with_encoded_id"

module EncodedId
  module Rails
    # Configuration
    class << self
      def configuration
        @configuration ||= Configuration.new
      end

      def configure
        yield(configuration) if block_given?
        configuration
      end
    end
  end

  # Expose directly on EncodedId
  WithEncodedId = Rails::WithEncodedId
end
