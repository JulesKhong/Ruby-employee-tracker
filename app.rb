require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('sinatra/activerecord')
require('./lib/employee')
require('./lib/division')
require('pg')

get('/') do
  @employees = Employee.all
  @divisions = Division.all
  erb(:index)
end

post('/add_division') do
  division_name = params.fetch('division_name')
  Division.create({:name => division_name})
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:index)
end

post('/add_employee') do
  employee_name = params.fetch('employee_name')
  division_id = params.fetch('divisions').to_i
  Employee.create({:name => employee_name, :division_id => division_id})
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:index)
end
