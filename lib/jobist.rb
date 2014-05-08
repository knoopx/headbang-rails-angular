require 'jobist/queue'

module Jobist
  class << self
    def [](name)
      self.queues[name] or raise "Unregistered queue: #{name}"
    end

    def push(job)
      self[job.queue].push(job)
    end

    alias_method :<<, :push

    def start
      self.queues.each do |_, queue|
        queue.workers.each(&:start)
      end
    end

    def shutdown
      self.queues.each do |_, queue|
        queue.workers.each(&:shutdown)
      end
    end

    def drain
      self.queues.each do |_, queue|
        queue.workers.each(&:drain)
      end
    end

    def queue(name, options = {})
      self.queues[name] and raise "Queue already defined: #{name}"
      self.queues[name] = Jobist::Queue.new(options)
    end

    def queues
      @queues ||= HashWithIndifferentAccess.new
    end

    def configure(start = true, &block)
      instance_eval(&block)
      self.start if start
    end
  end
end
