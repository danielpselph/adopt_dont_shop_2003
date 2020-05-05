require 'rails_helper'

RSpec.describe "shelter delete page" do
  context "as a visitor" do
    it "can delete a shelter from its show page" do
      
        shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave", city: "Richmond", state: "VA", zip: "12345")
        shelter2 = Shelter.create(name: "Turkey Paradise", address: "876 Sandwich Lane", city: "Cheyenne", state: "WY", zip: "23456")
        
        visit "/shelters/#{shelter1.id}"

        click_link "Delete Shelter"

        expect(current_path).to eq(shelters_path) 

        expect(page).to_not have_content(shelter1.name) 
        expect(page).to_not have_content("Randys Rodent Ranch") 
        expect(page).to have_content(shelter2.name) 
    end
  end
end

# As a visitor
# When I visit a shelter show page
# Then I see a link to delete the shelter
# When I click the link "Delete Shelter"
# Then a 'DELETE' request is sent to '/shelters/:id',
# the shelter is deleted,
# and I am redirected to the shelter index page where I no longer see this shelter
