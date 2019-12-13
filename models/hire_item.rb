require_relative("../db/sql_runner")

class HireItem

  attr_reader :id
  attr_accessor :item, :price

  def initialize (options)
    @id = options['id'].to_i if options ['id']
    @name = options['name']
    @price = options['price']
  end

  # ============== CREATE =================
  def save()
    sql = "INSERT INTO hire_stock (
    name, price
    ) VALUES (
      $1, $2
    ) RETURNING id"
    values = [@item, @price]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  # ============== READ =================

  def read()
    sql = "SELECT * FROM hire_stock WHERE id = $1"
    values = [@id]
    hire_item_hash = SqlRunner.run(sql, values)
    result = HireItem.new(hire_item_hash.first)
    return result
  end

  def self.read_all()
    sql = "SELECT * FROM hire_stock"
    hire_stock = SqlRunner.run(sql)
    result = map_items(hire_stock)
    return result
  end

  # hire_stock = SqlRunner.run(sql)
  # HireStock.map(hire_stock)
  # ============== UPDATE =================

  def self.update()
    sql = "UPDATE hire_stock SET (name, price) = ($1, $2) WHERE id = $3"
    values = [@item, @price, @id]
    SqlRunner.run(sql, values)
  end

  # ============== DELETE =================

  def delete()
    sql = "DELETE FROM hire_stock WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
    return "Row deleted"
  end

  def self.delete_all()
    sql = "DELETE FROM hire_stock"
    SqlRunner.run(sql)
  end




end
