require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

# describe('adding a new division', {:type => :feature}) do
#   it('allows a user to add new divisions to the database, and see them listed on the page') do
#     visit('/')
#     fill_in('division_name', :with => 'HR')
#     click_button('Add Division')
#     expect(page).to have_content('HR')
#   end
# end
