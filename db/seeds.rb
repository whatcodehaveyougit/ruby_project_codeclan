require_relative("../models/hireOrder")
require_relative("../models/customer")
require_relative("../models/hireItem")

# require("pry") testing tool for development only

HireOrder.delete_all()
Customer.delete_all()
HireItem.delete_all()

customer1 = Customer.new ({
	'name' => 'Andrew',
	'address' => '24 Main Street, Edinburgh, EH5 9LT',
	'phone' => 123456
})
customer1.save()

customer2 = Customer.new ({ 'name' => 'Oscar',
	'address' => '12 Park Lane, Edinburgh, EH1 1LA',
	'phone' => 123456
})
customer2.save()

customer3 = Customer.new ({ 'name' => 'Andrew',
	'address' => '64 Zoo Lane, Edinburgh, EH3 1LT',
	'phone' => 123456
})
customer3.save()

customer4 = Customer.new ({ 'name' => 'Johnny',
	'address' => '1 St Andrews Sqaure, Edinburgh, EH45 1LT',
	'phone' => 123456
})
customer4.save()

customer5 = Customer.new ({ 'name' => 'Mike',
	'address' => '4 Mayfair, Edinburgh, EH10 1LT',
	'phone' => 123456
})
customer5.save()

hire_item1 = HireItem.new ({
	'name' => 'Shure SM58 Microphone',
	'price' => 20
})
hire_item1.save()

hire_item2 = HireItem.new ({
	'name' => 'DAS Action 12 Speakers',
	'price' => 150
})
hire_item2.save()

hire_item3 = HireItem.new ({
	'name' => 'Speaker Stands',
	'price' => 50
})
hire_item3.save()

hire_item4 = HireItem.new ({
	'name' => 'Subwoofer',
	'price' => 100
})
hire_item4.save()

hire_item5 = HireItem.new ({
	'name' => 'DI Box',
	'price' => 10
})
hire_item5.save()


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
	'notes' => 'is collecting at 9pm'
})
hire_order2.save()

hire_order3 = HireOrder.new ({
	'customer_id' => customer1.id,
	'hire_item_id' => hire_item2.id,
	'price' => hire_item2.price,
	'start_date' => '2001-04-16',
	'end_date' => '2001-04-19',
	'notes' => 'is collecting at 8pm'
})
hire_order3.save()

hire_order4 = HireOrder.new ({
	'customer_id' => customer3.id,
	'hire_item_id' => hire_item2.id,
	'price' => hire_item2.price,
	'start_date' => '2001-04-16',
	'end_date' => '2001-04-19',
	'notes' => 'is collecting at 4pm'
})
hire_order4.save()

hire_order5 = HireOrder.new ({
	'customer_id' => customer2.id,
	'hire_item_id' => hire_item1.id,
	'price' => hire_item1.price,
	'start_date' => '2001-04-16',
	'end_date' => '2001-04-19',
	'notes' => 'is collecting at 3pm'
})
hire_order5.save()
#
# binding.pry
# nil
