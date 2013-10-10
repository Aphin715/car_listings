require 'spec_helper'

feature 'add a manufactuer', %Q{
   As a car salesperson
I want to record a car manufactuer
So that I can keep track of the types of cars found in the lot
} do
# Acceptance Criteria:

# * I must specify a manufacturer name, and country.
# * If I do not specify the required information,
#   I am presented with errors.
# * If I specify the required information, the manufacturer is recorded
#   and I am redirected to enter another new manufacturer.
 scenario 'specify valid information' do

  prev_count = Manufacturer.count

  visit '/manufacturers/new'
  fill_in 'Name', with: 'Ford'
  fill_in 'Country', with: 'United States'
  click_button 'Record'

  expect(page).to have_content('Manufacturer recorded.')
  expect(Manufacturer.count).to eql(prev_count + 1)
end

scenario 'specify invalid information' do
    prev_count = Manufacturer.count

    visit new_manufacturer_path

    click_button 'Record'
    expect(page).to have_content("can't be blank")
    expect(Manufacturer.count).to eql(prev_count)
end
  end

feature 'associate an car with a manufacturer', %Q{
  As a car salesman
  I want to record a car listing's manufacturer
  So that I can keep track of its manufacturer
  } do

#     Acceptance Criteria:

    # *When recording a car listing, I want to optionally associate
    #  it with its manufacturer.
    # *If I delete a manufacturer, the manufacturer and its
    #  primary key should no longer be associated with any car listings.
scenario 'car should be associated with manufacturer' do

    visit '/manufacturers/new'
    fill_in 'Name', with: 'Ford'
    fill_in 'Country', with: 'USA'
    click_button "Record"

    visit '/cars/new'
    fill_in 'Color', with: 'Red'
    fill_in 'Mileage', with: '30004'
    fill_in 'Year', with: '1986'
    fill_in 'Description', with: 'Large car with great features.'
    select 'Ford', from: "Manufacturer"
    click_button 'Record'

  end
end
