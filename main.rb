$LOAD_PATH.unshift(File.join(__dir__, 'lib'))

require 'producer'
require 'queue_simulator'
require 'worker_pool'
require 'dispatcher'
require 'logger_service'

# Initialize components
queue = QueueSimulator.new
dispatcher = Dispatcher.new
logger = LoggerService.new

# Start workers
worker_pool = WorkerPool.new(3, queue, dispatcher, logger)
worker_pool.start

# Start producer
producer = Producer.new('input/orders.json', queue)
producer.produce

# Wait for all workers
worker_pool.wait

puts "\nAll orders processed. Check notifications.db for logs."
