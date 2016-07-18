require('spec_helper')

describe(Employee) do
  describe('#division') do
    it 'returns the division for a given employee' do
      test_division = Division.create({:name => 'Marketing'})
      employee = Employee.create({:name => 'Leslie', :division_id => test_division.id})
      expect(employee.division).to(eq(test_division))
    end
  end
  describe('.delete_all') do
    it 'will delete a division and all of the employees in that division' do
      test_division = Division.create({:name => 'Accounting'})
      test_employee = Employee.create({:name => 'Bill', :division_id => test_division.id})
      test_employee2 = Employee.create({:name => 'Bob', :division_id => test_division.id})
      Employee.where(division_id: test_division.id).delete_all()
      expect(Employee.all()).to(eq([]))
    end
  end
end
