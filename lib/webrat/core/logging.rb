module Webrat
  module Logging 

    def debug_log(message) 
      return unless logger
      logger.debug message
    end

    def logger 
      case Webrat.configuration.mode
      when :rails
        defined?(RAILS_DEFAULT_LOGGER) ? RAILS_DEFAULT_LOGGER : nil
      when :merb
        Merb.logger
      else
        nil
      end
    end

  end
end
