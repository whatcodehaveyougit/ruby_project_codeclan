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



hire_order1 = HireOrder.new ({
	'customer_id' => customer1.id,
	'hire_item_id' => hire_item1.id,
	'price' => hire_item1.price,
	'start_date' => '1998-04-16',
	'end_date' => '1998-04-18',
	'notes' => 'is collecting at 7pm'
})
hire_order1.save()

hire_order2 = HireOrder.new ({
	'customer_id' => customer2.id,
	'hire_item_id' => hire_item2.id,
	'price' => hire_item2.price,
	'start_date' => '1998-04-16',
	'end_date' => '1998-05-17',
	'notes' => 'is collecting at 0pm'
})
hire_order2.save()

hire_order3 = HireOrder.new ({
	'customer_id' => customer1.id,
	'hire_item_id' => hire_item2.id,
	'price' => hire_item2.price,
	'start_date' => '2001-04-16',
	'end_date' => '2001-04-19',
	'notes' => 'is collecting at 0pm'
})
hire_order3.save()

hire_order4 = HireOrder.new ({
	'customer_id' => customer3.id,
	'hire_item_id' => hire_item2.id,
	'price' => hire_item2.price,
	'start_date' => '2001-04-16',
	'end_date' => '2001-04-19',
	'notes' => 'is collecting at 0pm'
})
hire_order4.save()

hire_order5 = HireOrder.new ({
	'customer_id' => customer2.id,
	'hire_item_id' => hire_item1.id,
	'price' => hire_item1.price,
	'start_date' => '2001-04-16',
	'end_date' => '2001-04-19',
	'notes' => 'is collecting at 0pm'
})
hire_order5.save()

binding.pry
nil
