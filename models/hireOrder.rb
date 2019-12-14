require_relative("../db/sql_runner")

class HireOrder

  def initialize (options)
    @id = options['id'] if options['id']
    @customer_id = options['customer_id']
    @hire_item_id = optons['hire_item_id']
    @start_date = options['start_date']
    @end_date = options['end_date']
    @notes = options['notes']
  end

  # ============== CREATE =================

  def save()
    sql = "INSERT INTO hire_orders (
    customer_id, hire_stock_id, start_date, end_date, notes
    ) VALUES ( $1, $2, $3, $4, $5 )"
    result = SqlRunner.run(sql, values)
    id = results.first['id']
    @id = id
  end



  # ============== READ =================

  def read()
    sql = "SELECT * FROM hire_orders WHERE id = $1"
    values = [@id]
    hire_order_hash = SqlRunner.run(sql, values)
    result = HireOrder.new(hire_order_hash.first)
    return result
  end

  def self.read_all()
    sql = "SELECT * FROM hire_orders"
    hire_orders = SqlRunner(sql)
    HireOrder.map(hire_orders)
  end

  # ============== UPDATE =================

  def update()
    sql = "UPDATE hire_orders SET (customer_id, hire_stock_id, start_date, end_date, notes)
    = ($1, $2, $3, $4, $5 ) WHERE id = $6"
    values = [@customer_id, @hire_stock_id, @start_date, @end_date, @notes]
    SqlRunner.run(sql, values)
  end
  # ============== DELETE =================

  def delete()
    sql = "DELETE FROM hire_orders WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
    return "Row Deleted"
  end

  def self.delete_all()
    sql = "DELETE FROM hire_orders"
    SqlRunner.run(sql)
  end












end
