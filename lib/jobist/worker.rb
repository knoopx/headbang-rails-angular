module Jobist
  class Worker
    def initialize(queue)
      @queue = queue
      @running = true
      at_exit { shutdown }
    end

    def start
      @thread = Thread.new do
        @queue.throttle { run(@queue.pop) } while running?
      end
    end

    def running?
      @running
    end

    def drain
      while !@queue.empty?
        sleep 1
      end
    end

    def shutdown
      @running = false
    end

    def run(job)
      job.call
    rescue Exception => exception
      handle_exception job, exception
    end

    def handle_exception(job, exception)
      puts "Error: #{job.inspect}\n#{exception.message}\n#{exception.backtrace.join("\n")}"
    end
  end
end
