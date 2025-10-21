class Dispatcher
  def deliver(order)
    puts "[Dispatcher] Sending message to #{order['email']}..."
    sleep(0.2)
    success = [true, true, true, false].sample
    puts success ? "[Dispatcher] Delivered to #{order['email']}" : "[Dispatcher] Failed delivery"
    success
  end
end
