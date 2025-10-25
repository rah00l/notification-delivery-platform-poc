class Dispatcher
  def deliver(job)
    puts "[Dispatcher] Sending message to #{job['email']}..."
    sleep(rand(0.3..1.0))   # random delay to simulate network latency
    if rand < 0.7
      puts "[Dispatcher] Delivered to #{job['email']}"
      :success
    else
      puts "[Dispatcher] Failed delivery"
      :failure
    end
  end
end
