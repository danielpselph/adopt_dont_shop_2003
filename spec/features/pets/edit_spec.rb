require 'rails_helper'

RSpec.describe "pet edit page" do
  context "as a visitor" do
    it "can update a pet from its show page" do

        shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave", city: "Richmond", state: "VA", zip: "12345")
        pet1 = shelter1.pets.create(name: "Geraldo", 
                                    image: "https://images.freeimages.com/images/large-previews/4bc/rodent-1383599.jpg", 
                                    age: 2,
                                    sex: "male")

        visit "/pets/#{pet1.id}"

        click_link "Update Pet Info"

        expect(current_path).to eq("/pets/#{pet1.id}/edit") 

        fill_in :name,	with: "Francine" 
        fill_in :age,	with: 3 
        fill_in :sex,	with: "female" 

        click_button "Update Pet"

        expect(current_path).to eq("/pets/#{pet1.id}") 

        expect(page).to have_content("Francine") 
        expect(page).to have_content(3) 
        expect(page).to have_content("female") 

        expect(subject).to_not have_content("Geraldo") 
        expect(subject).to_not have_content(2) 
        expect(subject).to_not have_content("male") 
      
    end
  end
end

# As a visitor
# When I visit a Pet Show page
# Then I see a link to update that Pet "Update Pet"
# When I click the link 
# I am taken to '/pets/:id/edit' where I see a form to edit the pet's data including:
# - image
# - name
# - description
# - approximate age
# - sex
# When I click the button to submit the form "Update Pet"
# Then a `PATCH` request is sent to '/pets/:id',
# the pet's data is updated,
# and I am redirected to the Pet Show page where I see the Pet's updated information