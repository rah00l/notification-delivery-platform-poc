require 'json'

class Producer
  def initialize(file_path, queue)
    @file_path = file_path
    @queue = queue
  end

  def produce
    data = JSON.parse(File.read(@file_path))
    data.each do |record|
      puts "[Producer] Queuing order ##{record['order_id']}"
      @queue.push(record)
      sleep(0.2) # simulate delay
    end
  end
end
