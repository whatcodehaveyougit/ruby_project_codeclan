require('sinatra')
require('sinatra/contrib/all') if development?
# require('pry') for development purposes only
require_relative('models/hireOrder')
require_relative('models/customer')
require_relative('models/hireItem')
also_reload('./models/*') 

get '/?' do
  erb(:index)
end

# ============== HIRE STOCK =================

get '/hire-stock/?' do
  @hireStock = HireItem.all()
  erb(:"hireStock/index")
end

get '/hire-stock/new' do
  erb( :"hireStock/new" )
end

get '/hire-stock/created' do
  erb ( :"/hireStock/created" )
end

post '/hire-stock/?' do
  HireItem.new(params).save()
  redirect to '/hire-stock/'
end

get '/hire-stock/:id' do
  @hireItem = HireItem.find( params[:id] )
  erb(:"hireStock/show")
end

get '/hire-stock/:id/edit' do
  @hireItem = HireItem.find( params[:id] )
  erb(:"hireStock/edit")
end

post '/hire-stock/:id' do
  hireItem = HireItem.new(params)
  hireItem.update()
  redirect to "/hire-stock/#{params[:id]}"
end

post '/hire-stock/:id/delete' do
  hireItem = HireItem.find(params[:id])
  hireItem.delete()
  redirect to "/hire-stock/"
end


# In the erb there cannot be a dash - does not like it

# ============== CUSTOMERS =================

get '/customers/?' do
  @customer = Customer.all()
  erb(:"customers/index")
end

get '/customers/new' do
  erb( :"customers/new" )
end

get '/customers/confirm/' do
  erb( :"customers/confirm" )
end

post '/customers/?' do
  Customer.new(params).save()
  redirect to "/customers/confirm/"
end

get '/customers/:id' do
  @customer = Customer.find ( params[:id] )
  erb(:"customers/show")
end

post '/customers/:id' do
  customer = Customer.new(params)
  customer.update
  redirect to "/customers/#{params['id']}"
end

get '/customers/:id/edit' do
  @customer = Customer.find( params[:id] )
  erb(:"customers/edit")
end


post '/customers/:id/delete' do
  customer = Customer.find ( params[:id] )
  customer.delete()
    redirect to "/customers/"
end


# ============== HIRE ORDERS =================

get '/hire-orders/new' do
  @customers = Customer.all()
  @hireStock = HireItem.all()
  erb(:"hireOrders/new")
end

get '/hire-orders/?' do
  @hire_orders = HireOrder.all()
  erb(:'hireOrders/index')
end

# === New ===

post '/hire-orders/?' do
  order = HireOrder.new(params)
  order.save()
  redirect to '/hire-orders'
end

# how to differentiate ===============
post '/hire-orders/save-customer' do
  Customer.new(params).save()
  redirect to '/hire-orders/new'
end

# === Update ===

get '/hire-orders/:id/edit' do
  @customers = Customer.all()
  @hireStock = HireItem.all()
  @hire_order = HireOrder.find( params[:id] )
  erb(:"hireOrders/edit")
end

post '/hire-orders/all-orders' do
  @hired_items = Customer.find(params[:customer_id]).hired

end

post '/hire-orders/:id/?' do
  hire_order = HireOrder.new( params )
  hire_order.update()
  redirect to "/hire-orders"
end

post '/hire-orders/:id/delete' do
  hire_order = HireOrder.find( params[:id] )
  hire_order.delete()
  redirect to "/hire-orders"
end

get '/hire-orders/all-orders' do
  @customers = Customer.all()
  erb (:"hireOrders/allOrders")
end
