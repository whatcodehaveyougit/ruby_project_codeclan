require_relative("../db/sql_runner")

class HireItem

  attr_reader :id
  attr_accessor :name, :price

  def initialize (options)
    @id = options['id'].to_i if options ['id']
    @name = options['name']
    @price = options['price'].to_i
  end

  # ============== CREATE =================
  def save()
    sql = "INSERT INTO hire_stock (
    name, price
    ) VALUES (
      $1, $2
    ) RETURNING id"
    values = [@name, @price]
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

  def self.all()
    sql = "SELECT * FROM hire_stock"
    item_data = SqlRunner.run(sql)
    item = map_items(item_data)
    return item
  end

  def self.map_items(item_data)
    return item_data.map { |item| HireItem.new(item) }
  end

  def self.find(id)
    sql = "SELECT * FROM hire_stock WHERE id = $1"
    values = [id]
    item_hash = SqlRunner.run(sql, values).first
    item = HireItem.new(item_hash)
    return item
  end

  # ============== UPDATE =================

  def update()
    sql = "UPDATE hire_stock SET (name, price) = ($1, $2) WHERE id = $3"
    values = [@name, @price, @id]
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
