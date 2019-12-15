require('sinatra')
require('sinatra/contrib/all')
require_relative('models/hireOrder')
# I changed this hireOrder and made it at the top instead of the bottom..
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
  @hireStock = HireItem.find( params[:id] )
  erb(:"hireStock/show")
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

post '/customers/?' do
  Customer.new(params).save()
  redirect to '/customers'
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


# ============== HIRE ORDERS =================

get '/hire-orders' do
  erb(:"hireOrders/index")
end
