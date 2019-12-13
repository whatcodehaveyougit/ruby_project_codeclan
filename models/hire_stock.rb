require_relative("../models/sql_runner")

class HireStock

  attr_reader :id
  attr_accessor :item :price

  def initialize (options)
    @id = options['id'].to_i if options ['id']
    @item = options['item']
    @price = options['price']
  end


  def save()
    sql = "INSERT INTO equipment_stock (
    item, price
    ) VALUES (
      $1, $2
    ) RETURNING id"
    values = [@item, @price]
    result = SqlRunner.sql(sql, values)
    id = result.first['id']
    @id = id
  end


  def self.delete_all()
    sql = "DELETE FROM equipment_stock"
    SqlRunner.run(sql)
  end





end
