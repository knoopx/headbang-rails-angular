module Jobist
  class Throttler
    def initialize(count, time_span)
      @count, @time_span = count, time_span.to_i
      @mutex = Mutex.new
      @condition = ConditionVariable.new
      @timestamps = [@count, (Time.now - @time_span)]
    end

    def wait
      @mutex.synchronize do
        delta = Time.now - @timestamps.first
        if delta.to_i < @time_span
          @condition.wait(@mutex)
        end
        @timestamps.push(Time.now).shift
      end
    end

    def continue
      @mutex.synchronize { @condition.signal }
    end
  end
end
