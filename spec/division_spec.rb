require('spec_helper')

describe(Division) do
  describe('#employees') do
    it 'returns all the employees that belong to the given division' do
      test_division = Division.create({:name => 'Accounting'})
      test_employee = Employee.create({:name => 'Bill', :division_id => test_division.id})
      test_employee2 = Employee.create({:name => 'Bob', :division_id => test_division.id})
      expect(test_division.employees()).to(eq([test_employee, test_employee2]))
    end
  end
end
