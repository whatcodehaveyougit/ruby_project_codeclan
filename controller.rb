require('sinatra')
require('sinatra/contrib/all')
require_relative('models/customer')
require_relative('models/hire_item')
require_relative('models/hire_order')
also_reload('./models/*')

get '/' do
  erb(:index)
end

get '/hire-stock' do
  @hire_stock = HireItem.all
  erb(:hire-stock)
end
