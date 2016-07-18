require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new division', {:type => :feature}) do
  it('allows a user to add new divisions to the database, and see them listed on the page') do
    visit('/')
    fill_in('division_name', :with => 'HR')
    click_button('Add Division')
    expect(page).to have_content('HR')
  end
  it('allows a user to add new employees to the database, and see them listed on the page') do
    visit('/')
    fill_in('division_name', :with => 'Paper')
    click_button('Add Division')
    fill_in('employee_name', :with => 'Sam')
    select('Paper', :from => 'divisions')
    click_button('Add Employee')
    expect(page).to have_content('Sam')
  end
  it('will remove a division from the divisions table') do
    visit('/')
    fill_in('division_name', :with => 'Paper')
    click_button('Add Division')
    select('Paper', :from => 'divisions')
    click_button('Close Division')
    expect(page).to have_no_content('Paper')
  end
  it('will remove an employee from the database') do
    visit('/')
    fill_in('division_name', :with => 'Paper')
    click_button('Add Division')
    fill_in('employee_name', :with=> 'Scott')
    select('Paper', :from => 'divisions')
    click_button('Terminate Employee')
    expect(page).to have_no_content('Scott')
  end
end
