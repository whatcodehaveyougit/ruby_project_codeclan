require_relative("..db/sql_runner.rb")

class Customer

	attr_reader :id
	attr_accessor :name, :address, :phone

	def initialize (options)
		@id = options['id'].to_i if options['id']
	  @name = options['name']
		@address = options['address']
		@phone = options['phone']
	end

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

		def delete_all()
			sql = "DELETE FROM customers"
			SqlRunner(sql)
		end



end
