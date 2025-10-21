class WorkerPool
  def initialize(size, queue, dispatcher, logger)
    @size = size
    @queue = queue
    @dispatcher = dispatcher
    @logger = logger
    @threads = []
  end

  def start
    @size.times do |i|
      @threads << Thread.new do
        loop do
          job = @queue.pop
          break unless job
          puts "[Worker #{i}] Processing order ##{job['order_id']}"
          result = @dispatcher.deliver(job)
          @logger.log(job, result)
          sleep(0.5)
        end
      end
    end
  end

  def wait
    @threads.each(&:join)
  end
end
