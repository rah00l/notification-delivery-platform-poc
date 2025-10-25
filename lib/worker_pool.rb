class WorkerPool
  def initialize(size, queue, dispatcher, logger)
    @size = size
    @queue = queue
    @dispatcher = dispatcher
    @logger = logger
    @threads = []
  end

  def start
      @size.times do |worker_id|
        @threads << Thread.new(worker_id) do |id|
          loop do
            job = @queue.pop
            break if job == :END

            puts "[Worker #{id}] Processing order ##{job['order_id']}"
            result = @dispatcher.deliver(job)
            @logger.log(job, result)

            sleep(rand(0.1..0.3)) # simulate processing
            Thread.pass
          end
        end
      end
    end

  def stop
    @size.times { @queue.push(:END) }
    @threads.each(&:join)
  end
end
