require 'rails_helper'

RSpec.describe "shelter pets index page" do
  context "as a visitor" do
    it "can create a new shelter pet" do

        shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave", city: "Richmond", state: "VA", zip: "12345")
        pet1 = shelter1.pets.create(name: "Geraldo", 
                                    image: "https://images.freeimages.com/images/large-previews/4bc/rodent-1383599.jpg", 
                                    age: 2,
                                    sex: "male")

        visit "/shelters/#{shelter1.id}/pets"

        click_link "Add New Pet"

        expect(current_path).to eq("/shelters/#{shelter1.id}/pets/new") 

        fill_in :name,	with: "Puppy" 
        fill_in :image,	with: "https://images.freeimages.com/images/large-previews/63d/dog-1383055.jpg"
        fill_in :age,	with: 1
        fill_in :sex,	with: "male" 
        fill_in :description,	with: "fun" 

        click_button "Create Pet"

        expect(current_path).to eq("/shelters/#{shelter1.id}/pets") 

        expect(page).to have_content("Puppy") 
        expect(page).to have_content(1) 
        expect(page).to have_content("male") 
        expect(page).to have_content("fun")
        expect(page).to have_css("img[src*='https://images.freeimages.com/images/large-previews/63d/dog-1383055.jpg']") 
        expect(page).to have_content("Adoptable") 

        expect(page).to have_content(pet1.name) 
        expect(page).to have_content(pet1.adoption_status) 
      
    end
  end
end

# - image
# - name
# - description
# - approximate age
# - sex ('female' or 'male')
# And I click the button "Create Pet"
# Then a `POST` request is sent to '/shelters/:shelter_id/pets',
# a new pet is created for that shelter,
# that pet has a status of 'adoptable',
# and I am redirected to the Shelter Pets Index page where I can see the new pet listed