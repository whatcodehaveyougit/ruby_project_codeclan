require_relative("../db/sql_runner")
require_relative("../models/customer")
require_relative("../models/hireItem")
require 'date'

class HireOrder

  attr_reader :id
  attr_accessor :customer_id, :hire_item_id, :start_date, :end_date, :notes

  def initialize (options)
    @id = options['id'] if options['id']
    @customer_id = options['customer_id']
    @hire_item_id = options['hire_item_id']
    @start_date = options['start_date']
    @end_date = options['end_date']
    @notes = options['notes']
  end

  # ============== CREATE =================

  def save()
    sql = "INSERT INTO hire_orders (
    customer_id, hire_item_id, start_date, end_date, notes
    ) VALUES ( $1, $2, $3, $4, $5
      ) RETURNING id"
      values = [@customer_id, @hire_item_id, @start_date, @end_date, @notes]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end


  # ============== READ =================




  def hire_item()
    sql = "SELECT * FROM hire_stock WHERE id = $1"
    values = [@hire_item_id]
    hire_item_hash = SqlRunner.run(sql, values)
    return HireItem.new(hire_item_hash.first)
  end

  def self.all()
    sql = "SELECT * FROM hire_orders"
    hire_orders = SqlRunner.run(sql)
    hire_orders.map { |order| HireOrder.new(order) }
  end

  def self.find(id)
    sql = "SELECT * FROM hire_orders WHERE id = $1"
    values = [id]
    hire_item_hash = SqlRunner.run(sql, values).first
    return HireOrder.new(hire_item_hash)
  end

  # ============== UPDATE =================

  def update()
    sql = "UPDATE hire_orders SET
    (customer_id, hire_item_id, start_date, end_date, notes)
     = ($1, $2, $3, $4, $5 ) WHERE id = $6"
    values = [@customer_id, @hire_item_id, @start_date, @end_date, @notes, @id]
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

  def customer()
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [@customer_id]
    hash = SqlRunner.run(sql, values)
    return Customer.new(hash.first)
  end

  def hire_item()
    sql = "SELECT * FROM hire_stock WHERE id = $1"
    values = [@hire_item_id]
    hire_item_hash = SqlRunner.run(sql, values)
    return HireItem.new(hire_item_hash.first)
  end

# A Hire Order Instantiation is getting passed into here
  def hire_order()
    return
  end

  def full_price()
    a = calc()
    b = hire_item().price
    return a * b
  end

  def discounted_price()
    a = full_price()
    if a > 100
      a * 0.9
    else return a.to_i
    end
  end

  def calc()
    sql = "SELECT hire_orders.start_date, hire_orders.end_date FROM hire_orders WHERE id = $1;"
    values = [@id]
    result = SqlRunner.run(sql, values).first
    a = Date.parse(result["end_date"])
    b = Date.parse(result["start_date"])
     return (a - b).to_i
  end










  # I ended up not using this and using the methods instead to get the data.
  # THis works but I could not get this to display on the front end
    # def order()
    #   sql = "SELECT customers.name, hire_stock.name, hire_orders.id, hire_orders.notes
    #   FROM
    #   ((customers
    #     INNER JOIN hire_orders ON hire_orders.customer_id = customers.id)
    #     INNER JOIN hire_stock ON hire_orders.hire_item_id = hire_stock.id);"
  	# 	order_info = SqlRunner.run(sql)
    #   return order_info.map { |k,v| [k, v] }
    # end



end
