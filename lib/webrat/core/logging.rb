require "logger"

module Webrat
  module Logging #:nodoc:

    def debug_log(message) # :nodoc:
      return unless logger
      logger.debug message
    end

    def logger # :nodoc:
      case Webrat.configuration.mode
      when :rails
        defined?(RAILS_DEFAULT_LOGGER) ? RAILS_DEFAULT_LOGGER : nil
      when :merb
        ::Merb.logger
      else
        @logger ||= ::Logger.new(Webrat.configuration.log_file_path)
      end
    end

  end
end
