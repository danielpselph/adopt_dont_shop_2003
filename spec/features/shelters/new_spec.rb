require 'rails_helper'

RSpec.describe "shelter new page" do
  context "as a visitor" do
    it "create a new shelter" do

        shelter2 = Shelter.create(name: "Turkey Paradise", address: "876 Sandwich Lane", city: "Cheyenne", state: "WY", zip: "23456")

        visit shelters_path

        click_link "Add New Shelter"

        expect(current_path).to eq(shelters_new_path) 

        fill_in :name,	with: "Bob" 
        fill_in :address,	with: "222 St" 
        fill_in :city,	with: "Denver" 
        fill_in :state,	with: "CO" 
        fill_in :zip,	with: "80220" 

        click_button "Create Shelter"

        expect(current_path).to eq(shelters_path)

        expect(page).to have_content("Bob") 

    end
  end
end


# As a visitor
# When I visit the Shelter Index page
# Then I see a link to create a new Shelter, "New Shelter"
# When I click this link
# Then I am taken to '/shelters/new' where I  see a form for a new shelter
# When I fill out the form with a new shelter's:
# - name
# - address
# - city
# - state
# - zip
# And I click the button "Create Shelter" to submit the form
# Then a `POST` request is sent to '/shelters',
# a new shelter is created,
# and I am redirected to the Shelter Index page where I see the new Shelter listed.