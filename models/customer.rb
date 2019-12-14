require_relative("../db/sql_runner")


class Customer

	attr_reader :id
	attr_accessor :name, :address, :phone


	def initialize (options)
		@id = options['id'].to_i if options['id']
	  @name = options['name']
		@address = options['address']
		@phone = options['phone']
	end

# ============== CREATE =================
	def save()
		sql = "INSERT INTO customers (
			name, address, phone
		) VALUES (
			$1, $2, $3
			) RETURNING id"
			values = [@name, @address, @phone]
			result = SqlRunner.run(sql, values)
			id = result.first['id']
			@id = id
		end
# ============== READ =================

	def read()
		sql = "SELECT * FROM customers WHERE id = $1"
		values = [@id]
		customer = SqlRunner.run(sql, values)
		result = Customer.new(customer.first)
		return result
	end

	def self.all()
		sql = "SELECT * FROM customers"
		customers = SqlRunner.run(sql)
		result = customers.map {|customer_hash| Customer.new(customer_hash)}
		return result
	end

	def self.find(id)
		sql = "SELECT * FROM customers WHERE id = $1"
		values = [id]
		customer = SqlRunner.run(sql, values).first
		customer_info = Customer.new(customer)
		return customer_info
	end



# ============== UPDATE =================

def update()
	sql = "UPDATE customers SET (name, address, phone) = ($1, $2, $3) WHERE id = $4"
	values = [@name, @address, @phone, @id]
	SqlRunner.run(sql, values)
	return values
end


# ============== DELETE =================

	def delete()
		sql = "DELETE FROM customers WHERE id = $1"
		values = [@id]
		SqlRunner.run(sql, values)
		return "Row Deleted"
	end

	def self.delete_all()
		sql = "DELETE FROM customers"
		SqlRunner.run(sql)
	end



end
