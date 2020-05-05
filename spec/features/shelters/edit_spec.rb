require 'rails_helper'

RSpec.describe "shelter edit page" do
  context "as a visitor" do
    it "can edit a shelters info" do

        shelter2 = Shelter.create(name: "Turkey Paradise", address: "876 Sandwich Lane", city: "Cheyenne", state: "WY", zip: "23456")

        visit "/shelters/#{shelter2.id}"

        click_link "Edit Shelter"

        expect(current_path).to eq("/shelters/#{shelter2.id}/edit") 

        fill_in :name,	with: "Turkey Kingdom" 
        fill_in :state,	with: "KY" 
        fill_in :zip,	with: "98989" 

        click_button "Update Shelter"

        expect(current_path).to eq("/shelters/#{shelter2.id}") 

        expect(page).to have_content("Kingdom") 
        expect(page).to have_content("KY") 
        expect(page).to have_content("98989") 
        expect(page).to_not have_content("Paradise")
        expect(page).to_not have_content("WY")
        expect(page).to_not have_content("23456")


    end
  end
end



# As a visitor
# When I visit a shelter show page
# Then I see a link to update the shelter "Update Shelter"
# When I click the link "Update Shelter"
# Then I am taken to '/shelters/:id/edit' where I  see a form to edit the shelter's data including:
# - name
# - address
# - city
# - state
# - zip
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/shelters/:id',
# the shelter's info is updated,
# and I am redirected to the Shelter's Show page where I see the shelter's updated info