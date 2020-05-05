require 'rails_helper'

RSpec.describe "shelter index page" do
  context "as a visitor" do
    it "can see name of each shelter" do

        shelter1 = Shelter.create(name: "Randys Rodent Ranch", address: "555 Hamster Ave", city: "Richmond", state: "VA", zip: "12345")
        shelter2 = Shelter.create(name: "Turkey Paradise", address: "876 Sandwich Lane", city: "Cheyenne", state: "WY", zip: "23456")


        visit "/shelters"

        expect(page).to have_content(shelter1.name) 
        expect(page).to have_link(shelter2.name) 

    end
  end
end
