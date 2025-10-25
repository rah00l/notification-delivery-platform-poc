# lib/queue_simulator.rb
class QueueSimulator
  def initialize
    @queue = Queue.new
  end

  def <<(item)
    @queue << item
  end

  def push(item)
    @queue << item
  end

  # Change to blocking pop
  def pop
    @queue.pop
  end
end
