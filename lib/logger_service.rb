require 'sqlite3'

class LoggerService
  def initialize(db_file = 'notifications.db')
    @db = SQLite3::Database.new(db_file)
    create_table
  end

  def create_table
    @db.execute <<-SQL
      CREATE TABLE IF NOT EXISTS logs (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        order_id INTEGER,
        email TEXT,
        success BOOLEAN,
        timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
      );
    SQL
  end

  def log(order, success)
    @db.execute("INSERT INTO logs (order_id, email, success) VALUES (?, ?, ?)", 
                [order['order_id'], order['email'], success ? 1 : 0])
  end
end
