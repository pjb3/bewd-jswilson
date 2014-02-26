TAX_RATE = 1.05

def calculate_total(order=[])
	total = 0
   	for item in order
		quantity = item[:quantity]
		unit_price = item[:unit_price]
		total += quantity * unit_price
	end

	total *= TAX_RATE
	return "$%.2f" % total
end

def calculate_total_var_args(*order)
	# identical to above function, but takes in variable number of arguments
	# though the code is identical, I couldn't make a single function work
	# with both an array and a variable number of arguments
	total = 0
   	for item in order
		quantity = item[:quantity]
		unit_price = item[:unit_price]
		total += quantity * unit_price
	end

	total *= TAX_RATE
	return "$%.2f" % total
end
