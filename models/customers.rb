require_relative(..db/sql_runner.rb)

class Customer

attr_reader :id
attr_accessor :name, :address, :phone

def initialize (options)
	@id = options['id'].to_i if options['id']
  @first_name = options['first_name']




end
