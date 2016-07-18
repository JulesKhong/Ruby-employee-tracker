require('spec_helper')

describe(Employee) do
  describe('#division') do
    it 'returns the division for a given employee' do
      test_division = Division.create({:name => 'Marketing'})
      employee = Employee.create({:name => 'Leslie', :division_id => test_division.id})
      expect(employee.division).to(eq(test_division))
    end
  end
end
