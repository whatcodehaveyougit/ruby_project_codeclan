require("pry")
require_relative("../models/hire_order")
require_relative("../models/customer")
require_relative("../models/equipment")

HiredEquipment.delete_all()
Customer.delete_all()
Equipment.delete_all()

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
	'address' => '64 Zoo Lane,
	Edinburgh, EH1 1LT',
	'phone' => 123456
})
customer3.save()

equipment1 = Equipment.new ({
	'item' => 'shure sm58',
	'price' => 20
})
equipment1.save()


equipment1 = Equipment.new ({
	'item' => 'DAS Action 12',
	'price' => 100
})


# hire_order1 = HireOrder.new ({
# 	'customer_id' => customer1.id,
# 	'hired_equipment' => equipment1.id,
# 	'price' => equipment.price,
# 	'start_date' => 12/1/19
# 	'end_date' => 14/1/19
# 	'notes' => 'is collecting at 6pm'
# })
