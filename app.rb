require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('sinatra/activerecord')
require('./lib/employee')
require('./lib/division')
require('./lib/project')
require('pg')

get('/') do
  @employees = Employee.all
  @divisions = Division.all
  @projects = Project.all
  erb(:index)
end

post('/add_division') do
  division_name = params.fetch('division_name')
  Division.create({:name => division_name})
  @divisions = Division.all()
  @employees = Employee.all()
  @projects = Project.all
  erb(:index)
end

post('/add_employee') do
  employee_name = params.fetch('employee_name')
  division_id = params.fetch('divisions').to_i
  Employee.create({:name => employee_name, :division_id => division_id})
  @divisions = Division.all()
  @employees = Employee.all()
  @projects = Project.all
  erb(:index)
end

delete('/delete_employee') do
  employee_id = params.fetch('employee_name_delete').to_i
  Employee.delete(employee_id)
  @divisions = Division.all()
  @employees = Employee.all()
  @projects = Project.all
  erb(:index)
end

delete('/delete_division') do
  division_id = params.fetch('division_name_delete').to_i
  Division.delete(division_id)
  Employee.where(division_id: division_id).delete_all
  @divisions = Division.all
  @employees = Employee.all
  @projects = Project.all
  erb(:index)
end

get('/show_employees') do
  division_id = params.fetch('division_list').to_i
  division = Division.find(division_id)
  @employee_names = division.employees()
  @divisions = Division.all
  @employees = Employee.all
  @projects = Project.all
  erb(:index)
end

post('/add_project') do
  project_name = params.fetch('project_name')
  Project.create({:name => project_name})
  @projects = Project.all
  @divisions = Division.all
  @employees = Employee.all
  erb(:index)
end

get('/project/:id') do
  project_id = params.fetch('id').to_i
  @project = Project.find(project_id)
  @employees_proj = @project.employees
  @employees = Employee.all
  erb(:project)
end

patch('/add_employee_project') do
  project_id = params.fetch('project_id').to_i
  @project = Project.find(project_id)
  employee_id = params.fetch('all_employees').to_i
  employee = Employee.find(employee_id)
  employee.update({:project_id => project_id})
  @employees_proj = @project.employees
  @employees = Employee.all
  erb(:project)
end

patch('/add_project_employee') do
  project_id = params.fetch('project_select').to_i
  employee_id = params.fetch('employee_select').to_i
  employee = Employee.find(employee_id)
  employee.update({:project_id => project_id})
  @employees = Employee.all
  @projects = Project.all
  @divisions = Division.all
  erb(:index)
end

delete('/delete_project') do
  project_id = params.fetch('project_delete').to_i
  project = Project.find(project_id)
  project.delete()
  @employees = Employee.all
  @projects = Project.all
  @divisions = Division.all
  erb(:index)
end
