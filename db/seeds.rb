require_relative("../models/hireOrder")
require_relative("../models/customer")
require_relative("../models/hireItem")

require("pry")

HireOrder.delete_all()
Customer.delete_all()
HireItem.delete_all()

customer1 = Customer.new ({
	'name' => 'Andrew',
	'address' => '64 Zoo Lane, Edinburgh, EH1 1LT',
	'phone' => 123456
})
customer1.save()

customer2 = Customer.new ({ 'name' => 'Oscar',
	'address' => '64 Zoo Lane, Edinburgh, EH1 1LT',
	'phone' => 123456
})
customer2.save()

customer3 = Customer.new ({ 'name' => 'Andrew',
	'address' => '64 Zoo Lane, Edinburgh, EH1 1LT',
	'phone' => 123456
})
customer3.save()

hire_item1 = HireItem.new ({
	'name' => 'shure sm58',
	'price' => 20
})
hire_item1.save()

hire_item2 = HireItem.new ({
	'name' => 'DAS Action 12',
	'price' => 100
})
hire_item2.save()

hire_item3 = HireItem.new ({
	'name' => 'Stands',
	'price' => 100
})
hire_item3.save()

binding.pry
nil

# hire_order1 = HireOrder.new ({
# 	'customer_id' => customer1.id,
# 	'hired_equipment' => equipment1.id,
# 	'price' => equipment.price,
# 	'start_date' => 12/1/19
# 	'end_date' => 14/1/19
# 	'notes' => 'is collecting at 6pm'
# })
