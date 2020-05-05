require 'rails_helper'

RSpec.describe "pet index page" do
  context "as a visitor" do
    it "can see each pet and their info" do

        shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave", city: "Richmond", state: "VA", zip: "12345")
        shelter2 = Shelter.create(name: "Turkey Paradise", address: "876 Sandwich Lane", city: "Cheyenne", state: "WY", zip: "23456")
        pet1 = shelter1.pets.create(name: "Geraldo", 
                                    image: "https://images.freeimages.com/images/large-previews/4bc/rodent-1383599.jpg", 
                                    age: 2,
                                    sex: "male")
        pet2 = shelter2.pets.create(name: "Geraldo", 
                                    image: "https://images.freeimages.com/images/large-previews/790/turkey-1368576.jpg", 
                                    age: 4,
                                    sex: "male")

        visit "/pets"

        within "#pet-#{pet1.id}" do
            expect(page).to have_content(pet1.name) 
            expect(page).to have_css("img[src*='#{pet1.image}']") 
            expect(page).to have_content(pet1.age) 
            expect(page).to have_content(pet1.sex) 
            expect(page).to have_content(pet1.shelter.name)
        end

        within "#pet-#{pet2.id}" do
            expect(page).to have_content(pet2.name) 
            expect(page).to have_css("img[src*='#{pet2.image}']") 
            expect(page).to have_content(pet2.age) 
            expect(page).to have_content(pet2.sex) 
            expect(page).to have_content(pet2.shelter.name)
        end

    end
  end
end

# As a visitor
# When I visit '/pets'
# Then I see each Pet in the system including the Pet's:
# - image
# - name
# - approximate age
# - sex
# - name of the shelter where the pet is currently located

# - image
# - name
# - description
# - approximate age
# - sex
# - adoptable/pending adoption status