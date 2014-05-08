require 'thread'
require 'jobist/worker'

module Jobist
  class Queue < ::Queue
    attr_reader :throttler

    def initialize(options = {})
      super()
      @options = options
    end


    def workers
      @workers ||= @options.fetch(:workers, 5).times.map { Worker.new(self) }
    end

    def throttle(&block)
      throttler.wait if throttler
      block.call
    ensure
      throttler.continue if throttler
    end

    def throttler
      @throttler ||= begin
        if @options.key?(:throttle)
          Throttler.new(*@options[:throttle].first)
        else
          false
        end
      end
    end
  end
end
