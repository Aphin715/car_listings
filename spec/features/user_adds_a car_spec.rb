require 'spec_helper'

feature 'add a car', %Q{
    As a car salesperson
I want to record a newly acquired car
So that I can list it in my lot
} do

    # Acceptance Criteria:

    # I must specify the color, year, mileage of the car.
    # Only years from 1980 and above can be specified.
    # I can optionally specify a description of the car.
    # If I enter all of the required information in the required format, the car is recorded.
    # If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
    # Upon successfully creating a car, I am redirected so that I can create another car.


 scenario 'specify valid information' do

  prev_count = Car.count

  visit '/cars/new'
  fill_in 'Color', with: 'Red'
  fill_in 'Mileage', with: '30004'
  fill_in 'Year', with: '1986'
  fill_in 'Description', with: 'Large car with great features.'
  click_button 'Record'
  expect(page).to have_content("Car recorded.")
  expect(Car.count).to eql(prev_count + 1)

 end

 scenario 'specify invalid information' do
    prev_count = Car.count

    visit new_car_url

    click_button 'Record'
    expect(page).to have_content("can't be blank")
    expect(Car.count).to eql(prev_count)

  end
end
