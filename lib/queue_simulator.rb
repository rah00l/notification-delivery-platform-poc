class QueueSimulator
  def initialize
    @queue = Queue.new
  end

  def push(item)
    @queue << item
  end

  def pop
    @queue.pop(true) rescue nil
  end

  def size
    @queue.size
  end
end
